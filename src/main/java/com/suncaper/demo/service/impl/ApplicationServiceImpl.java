package com.suncaper.demo.service.impl;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import com.suncaper.demo.common.Constant;
import com.suncaper.demo.common.SecurityUtils;
import com.suncaper.demo.common.SessionUtils;
import com.suncaper.demo.common.utils.ExcelUtil;
import com.suncaper.demo.common.utils.formatUtils;
import com.suncaper.demo.entity.*;
import com.suncaper.demo.entity.vo.StatisticsVo;
import com.suncaper.demo.mapper.ApplicationMapper;
import com.suncaper.demo.mapper.KnrdMapper;
import com.suncaper.demo.mapper.StudentMapper;
import com.suncaper.demo.mapper.TeacherMapper;
import com.suncaper.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.java2d.pipe.AlphaPaintPipe;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * @author zyq
 * @date 2020/11/25 - 11:25
 */
@Service
public class ApplicationServiceImpl implements ApplicationService {
    @Autowired
    private ApplicationMapper applicationMapper;
    @Autowired
    private KnrdService knrdService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private FlowSettingService flowSettingService;
    @Autowired
    private AuditHistoryService auditHistoryService;
    @Override
    public void insert(Application application) {
        //此时application中只有一个applicationReason字段的值，因为只从前端传回来这一个值，所以需要从当前对象中获取更多的值
        //根据当前对象获取sn
        User curUser = SessionUtils.getCurUser();
        String sn = curUser.getSn();
        //根据当前用户获取困难等级认定
        Knrd knrd = knrdService.selectByUser(curUser);
        //根据当前用户可以获取学生的基本信息
        Student student = studentService.selectByUser(curUser);
        //根据当前用户可以获取批次的基本信息
        Batch curBatch = batchService.getCurBatch();
        application.setBatchId(curBatch.getId())
                .setSn(student.getSn()).setName(student.getName()).setGender(Constant.GENDER_MAN.equals(student.getGender())?"M":"F")
                .setApplyDate(new Date()).setCollegeSn(student.getCollegeCode()).setCollegeName(student.getCollege())
                .setMajorSn(student.getMajorCode()).setMajorName(student.getMajor())
                .setClassSn(student.getClassCode()).setClassName(student.getClazz())
                .setDifficultyLevel(formatUtils.difficultyTransferUtils(knrd.getPovertyLevel()))
                .setCurrentNodeCode(Constant.ROLE_NODE_1)
                .setStatus(Constant.STATUS_DSH);
        applicationMapper.insertSelective(application);
    }

    @Override
    public boolean getCurApplication() {
        //根据当前的批次id和学号唯一的确定一个学生的申请
        User curUser = SessionUtils.getCurUser();
        Batch curBatch = batchService.getCurBatch();
        ApplicationExample applicationExample = new ApplicationExample();
        applicationExample.createCriteria().andBatchIdEqualTo(curBatch.getId()).andSnEqualTo(curUser.getSn());
        List<Application> applications = applicationMapper.selectByExample(applicationExample);
        return applications.size() != 0;
    }


    //获取审核列表
    @Override
    public List<Application> listBySn() {
        User curUser = SecurityUtils.getCurUser();
        List<Application> applicationList = new ArrayList<>();
        ApplicationExample applicationExample = new ApplicationExample();
        if(Constant.STUDENT_ROLE_ID.equals(curUser.getRoleId())){
            //如果是学生就是查看自己一个人的申请
            applicationExample.createCriteria().andSnEqualTo(curUser.getSn());
            applicationList = applicationMapper.selectByExample(applicationExample);
        }
        /*if(Constant.TEACHER_ROLE_ID.equals(curUser.getRoleId())){
            //如果是辅导员就查看自己所带的班级的同学的申请
            TeacherExample teacherExample = new TeacherExample();
            teacherExample.createCriteria().andUsersnEqualTo(curUser.getSn()).andRoleidEqualTo(Constant.COLLEGE_ROLE_ID);
            List<Teacher> teacherList = teacherService.selectByExample(teacherExample);
            List<String> banjiSns = teacherList.stream().map(teacher ->
                    teacher.getOrganizationsn()
            ).collect(Collectors.toList());
            applicationExample.createCriteria().andClassSnIn(banjiSns);
            applicationList = applicationMapper.selectByExample(applicationExample);
        }*/
        if(Constant.COLLEGE_ROLE_ID.equals(curUser.getRoleId())){
            //如果是学院就查看自己所在学院的同学的申请
            TeacherExample teacherExample = new TeacherExample();
            teacherExample.createCriteria().andUsersnEqualTo(curUser.getSn()).andRoleidEqualTo(Constant.COLLEGE_ROLE_ID);
            List<Teacher> teacherList = teacherService.selectByExample(teacherExample);
            List<String> xueyuanSns = teacherList.stream().map(teacher ->
                    teacher.getOrganizationsn()
            ).collect(Collectors.toList());
            applicationExample.createCriteria().andCollegeSnIn(xueyuanSns);
            applicationList = applicationMapper.selectByExample(applicationExample);
        }
        if(Constant.SCHOOL_ROLE_ID.equals(curUser.getRoleId())){
            //如果是校方就可以直接查看所有，没有条件约束
            applicationList = applicationMapper.selectByExample(null);
        }

        applicationList.stream().forEach(app->{
            app.setBatch(batchService.selectByPrimaryKey(app.getBatchId()));
            app.setDifValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,app.getDifficultyLevel()));
            app.setStatusValue(dictionaryService.getNameByValueAndType(Constant.STATUS_TYPE,app.getStatus()));
        });
        return applicationList;
    }





    @Override
    public List<Application> waitAudit() {
        //获取当前用户的角色id
        User curUser = SecurityUtils.getCurUser();
        //查询条件是节点为1并且审核状态是待审核状态,初始查询条件
        ApplicationExample applicationExample = new ApplicationExample();
        ApplicationExample.Criteria criteria = applicationExample.createCriteria();
        if(Constant.TEACHER_ROLE_ID.equals(curUser.getRoleId())){
            //如果是辅导员，则查询条件是 节点为1并且是待审核状态，且审核范围是自己所带的班级里面的
            //获取辅导员所带班级的sn
            TeacherExample teacherExample = new TeacherExample();
            //在usermanage表中通过教师的sn和roleid = 4（辅导员）查到的所有教师信息集合
            teacherExample.createCriteria().andUsersnEqualTo(curUser.getSn()).andRoleidEqualTo(Constant.TEACHER_ROLE_ID);
            List<Teacher> teacherList = teacherService.selectByExample(teacherExample);
            //遍历教师组织的集合，拿到班级sn的集合
            List<String> banjiSns = teacherList.stream().map(teacher ->
                teacher.getOrganizationsn()
            ).collect(Collectors.toList());
            //这是辅导员的待我审核
            //将辅导员的待我审核查询条件限制在自己所带的班级（范围），作为一个条件加入到查询条件中
            //还有一个条件是辅导员审核的当前的节点是1（只能审核自己可以审核的）
            criteria.andCurrentNodeCodeEqualTo(Constant.ROLE_NODE_1).andClassSnIn(banjiSns);
        }else if(Constant.COLLEGE_ROLE_ID.equals(curUser.getRoleId())){
            //这是学院的待我审核
            TeacherExample teacherExample = new TeacherExample();
            teacherExample.createCriteria().andUsersnEqualTo(curUser.getSn()).andRoleidEqualTo(Constant.COLLEGE_ROLE_ID);
            List<Teacher> teacherList = teacherService.selectByExample(teacherExample);
            List<String> xueyuanSns = teacherList.stream().map(teacher ->
                    teacher.getOrganizationsn()
            ).collect(Collectors.toList());
            criteria.andCurrentNodeCodeEqualTo(Constant.ROLE_NODE_2).andCollegeSnIn(xueyuanSns);
        }else if(Constant.SCHOOL_ROLE_ID.equals(curUser.getRoleId())){
            //这是学校的待我审核
            criteria.andCurrentNodeCodeEqualTo(Constant.ROLE_NODE_3);
        }
        criteria.andStatusEqualTo(Constant.STATUS_DSH);
        List<Application> applications = applicationMapper.selectByExample(applicationExample);
        applications.stream().forEach(app->{
            app.setBatch(batchService.selectByPrimaryKey(app.getBatchId()));
            app.setDifValue(dictionaryService.getNameByValueAndType(Constant.DIFFICULTY_TYPE,app.getDifficultyLevel()));
            app.setStatusValue(dictionaryService.getNameByValueAndType(Constant.STATUS_TYPE,app.getStatus()));
        });
        return applications;
    }

    @Override
    public void audit(AuditHistory auditHistory) {
        User curUser = SecurityUtils.getCurUser();
        auditHistory.setAuditBy(curUser.getSn());
        auditHistory.setAuditorName(curUser.getName());
        //通过当前审核历史中的application_id获取整个申请信息（application表里面有current_node）
        Application application = applicationMapper.selectByPrimaryKey(auditHistory.getApplicationId());
        auditHistory.setAuditNodeCode(application.getCurrentNodeCode());
        //通过此节点找到节点名称，在flowsetting里面
        String nodeName = flowSettingService.getNodeNameByNodeCode(application.getCurrentNodeCode());
        auditHistory.setAuditNodeName(nodeName);
        auditHistoryService.insert(auditHistory);
        //审核结果对原来申请的影响
        if(Constant.STATUS_TG.equals(auditHistory.getStatus())){
            //如果通过了
            //申请的状态不变，并且进入下一个节点
            //获取当前节点的下一个节点
            FlowSetting nextNode = flowSettingService.getNextNodeByCurNode(application.getCurrentNodeCode());
            if(nextNode != null){
                //继续走流程，申请的状态不变，进入下一个节点
                application.setCurrentNodeCode(nextNode.getNodeCode());
                if(nextNode.getNodeCode() == 4){
                    //说明当前节点为3，此时学校最高层已经通过了，下一个节点为4（流程走完了，审核通过了）
                    application.setStatus(Constant.STATUS_TG);
                    application.setAuditComment(auditHistory.getAuditComment());
                }
            }
        }else {
            //如果未通过
            application.setStatus(Constant.STATUS_BTG);
            application.setAuditComment(auditHistory.getAuditComment());
        }
        applicationMapper.updateByPrimaryKey(application);
    }

    @Override
    public void updateApp(Application application) {
        //首先通过sn和batchid得到用户当前的唯一的申请
        User curUser = SecurityUtils.getCurUser();
        Batch curBatch = batchService.getCurBatch();
        ApplicationExample applicationExample = new ApplicationExample();
        applicationExample.createCriteria().andSnEqualTo(curUser.getSn()).andBatchIdEqualTo(curBatch.getId());
        List<Application> applications = applicationMapper.selectByExample(applicationExample);
        Application curApp = applications.size() > 0?applications.get(0):null;
        application.setId(curApp.getId());
        //id skuId productId
        applicationMapper.updateByPrimaryKeySelective(application);
    }

    @Override
    public void export(HttpServletResponse response) {
        //设置Content-Type
        response.setContentType("application/vnd.ms-excel");
        //设置Content-Disposition
        response.setHeader("Content-Disposition", "attachment; filename=" + UUID.randomUUID().toString().substring(0,8) + ".xls");
        //获取所有申请
        List<Application> applications = listBySn();
        //将文件的流放进response
        try {
            ExcelUtil.exportApplication(response,applications);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public StatisticsVo statistics() {
        return applicationMapper.statistics();
    }
}
