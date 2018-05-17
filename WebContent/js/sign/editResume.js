//显示编辑框
function showEditView(){
    showSaveBtn();
    showCancelBtn();
    $("#editInfoBtn").hide();
    $("#formSearch input").attr("disabled",false);
}
//显示保存按钮
function showSaveBtn(){
    $("#saveInfoBtn").show();
}
//显示取消按钮
function showCancelBtn(){
    $("#cancelEditBtn").show();
}


function hideEditView(){
    hideSaveBtn();
    hideCancelBtn();
    $("#editInfoBtn").show();
    $("#formSearch input").attr("disabled",true);
}
function hideSaveBtn(){
    $("#saveInfoBtn").hide();
}
function hideCancelBtn() {
    $("#cancelEditBtn").hide();
}

//保存基本信息的方法
function saveInfo(){
    if($("#formSearch").validate().form()){
        var formData =  $("#formSearch").serialize();
        console.log(formData);
        $.ajax({
            type: "POST",
            url: ctx+"/resumeInfo/addOrUpdate.do",
            data: formData,
            dataType: "json",
            success: function (data) {
                if (data) {
                    hideEditView();
                    for(var name in data){
                        if($("#"+name)){
                            $("#"+name).val(data[name]);
                        }
                    }
                    ableNewWork();
                    ableNewSkill();
                } else {
                    layer.alert('操作失败', {icon: 5});
                }
            }
        });
    }
}
function ableNewWork() {

    if(!$("#work_modify") || $("#work_modify").length==0){
        if (!$("#newWork").data("events")) {
            $("#newWork").removeClass("unableNewBtn");
            $("#newWork").addClass("newBtn");
            $("#newWork").bind("click",newWork);
        } else {
            if(!$("#newWork").data("events")["click"]) {
                $("#newWork").removeClass("unableNewBtn");
                $("#newWork").addClass("newBtn");
                $("#newWork").bind("click",newWork);
            }
        }
    }
}
function disabledNewWork() {
    $("#newWork").removeClass("newBtn");//新增标签置灰
    $("#newWork").addClass("unableNewBtn");
    $("#newWork").unbind("click");
}

//新增工作经验
function newWork(){
    disabledNewWork();
    var experienceDiv = $("#experienceDiv");//工作经验div
    var workForm = $("<form style='height: 28rem' id='work_modify'></form>").addClass("form-horizontal").addClass("bottomBorder");//表单
    //鼠标放上去变橙色
    workForm.bind("mouseover",function () {
        $(this).removeClass("bottomBorder");
        $(this).addClass("orangeBorder");
    })
    //移出去变回无颜色
    workForm.bind("mouseout",function () {
        $(this).removeClass("orangeBorder");
        $(this).addClass("bottomBorder");
    })

    workForm.append("<input type='hidden' name='workExperienceId'>");
    workForm.append("<input type='hidden' name='resumeInfoId' value='"+$("#resumeInfoId").val()+"'>");

    //第一行
    var firstDiv = $('<div class="form-group" style="margin-top:15px"></div>');
    //公司
    var company = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="company">公司<span'+
        ' style="color: red">*</span></label>'+
        '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
        '<input type="text" class="form-control"  name="company" required="required">'+
        '</div>');
    firstDiv.append(company);
    //职位
    var job = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="job">职位<span'+
        ' style="color: red">*</span></label>'+
        '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
        '<input type="text" class="form-control"  name="job" required="required">'+
        '</div>');
    firstDiv.append(job);
    //开始时间
    var startTime = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="startTime">开始日期<span'+
    ' style="color: red">*</span></label>'+
      '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
        '<input type="text"  name="startTime" class="form_datetime form-control" required="required">'+
        '</div>');
    startTime.find("input").datetimepicker({
        format: 'yyyy-mm-dd', /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language: 'zh-CN',
        minView: "month"
    });
    firstDiv.append(startTime);
    workForm.append(firstDiv);

    //第二行
    var secondDiv = $('<div class="form-group" style="margin-top:15px"></div>');
    //结束时间
    var endTime = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="endTime">结束日期<span'+
        ' style="color: red">*</span></label>'+
        '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
        '<input type="text"  name="endTime" class="form_datetime form-control" required="required">'+
        '</div>');
    endTime.find("input").datetimepicker({
        format: 'yyyy-mm-dd', /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language: 'zh-CN',
        minView: "month"
    });
    secondDiv.append(endTime);

    workForm.append(secondDiv);

    //第三行
    var thirdDiv = $('<div class="form-group" style="margin-top:15px"></div>');
    //职责
    var description = '<label class="control-label col-sm-1">职责：<span style="color: red">*</span></label>'+
        '<div class="col-sm-8" style="width: 20%;padding: 5px"> <textarea required="required" name="description" class="form-control" style="resize: none;" ></textarea> </div>';
    thirdDiv.append(description);

    workForm.append(thirdDiv);
    //第四行
    var fourthDiv = $('<div class="form-group" style="margin-top:15px"  name="fourthDiv"></div>');
    var btn = '<div class="col-sm-4" style="text-align:left;float: none;margin: 0 auto" name="btnDiv">'+
        '<button  type="button" style="margin-left:50px"  name="saveExperienceBtn" class="btn btn-primary" onclick="saveWork()">保存</button>'+
        '<button  type="button" style="margin-left:50px" name="cancelExperienceBtn" class="btn btn-primary" onclick="hideExperienceView(true)">取消</button>'+
        '<button  type="button" style="margin-left:50px;display: none" name="editExperienceBtn" class="btn btn-primary">编辑</button>'+
        '<button  type="button" style="margin-left:50px;display: none" name="deleteExperienceBtn" class="btn btn-primary">删除</button>'+
        '</div>';
    fourthDiv.append(btn);

    workForm.append(fourthDiv);

    experienceDiv.prepend(workForm);

}

/**
 * 取消保存
 * @param selector 选择器
 * @param isDestroy 是否销毁
 */
function hideExperienceView(isDestroy){

    var id = $("#work_modify").find("input[name='workExperienceId']").val();
    if(isDestroy){
        $("#work_modify").remove();
    }else{
        //隐藏保存跟取消按钮
        $("#work_modify").find("button[name='saveExperienceBtn']").hide();
        $("#work_modify").find("button[name='cancelExperienceBtn']").hide();
        var modifyBtn = $("#work_modify").find("button[name='editExperienceBtn']");//编辑按钮
        modifyBtn.show();
        modifyBtn.bind("click",function () {
            showExperienceView(id);
        });//绑定编辑事件

        var deleteBtn = $("#work_modify").find("button[name='deleteExperienceBtn']");//删除按钮
        deleteBtn.show();
        deleteBtn.bind("click",function () {
            deleteWork(id);
        });//绑定编辑事件
        //只读
        $("#work_modify").find("input,textarea").attr("disabled",true);
        //修改表单的id
        $("#work_modify").attr("id","work_"+id);
    }
    ableNewWork();
}

/**
 * 显示表单编辑
 * @param formId //表单id
 */
function showExperienceView(formId){
    disabledNewWork();//禁止新增
    $("#work_" + formId).attr("id","work_modify");//修改id
    // 隐藏删除跟编辑按钮
    $("#work_modify").find("button[name='editExperienceBtn']").hide();
    $("#work_modify").find("button[name='deleteExperienceBtn']").hide();
    var saveBtn = $("#work_modify").find("button[name='saveExperienceBtn']");//保存按钮
    saveBtn.show();

    var cancelBtn = $("#work_modify").find("button[name='cancelExperienceBtn']");//取消按钮
    cancelBtn.show();
    cancelBtn.bind("click",function(){
        hideExperienceView(false);
    });

    $("#work_modify").find("input,textarea").attr("disabled",false);
}

//保存工作经验
function saveWork(){
    var form = $("#work_modify");
    if(form.validate().form()){
        form.css("height","28rem");
        var formData =  form.serialize();
        $.ajax({
            type: "POST",
            url: ctx+"/workExperience/addOrUpdate.do",
            data: formData,
            dataType: "json",
            success: function (data) {
                if (data) {
                    hideEditView();
                    for(var name in data){
                        if(form.find("input[name="+name+"]")){
                            form.find("input[name="+name+"]").val(data[name]);
                        }
                    }
                    //隐藏编辑
                    hideExperienceView(false);
                } else {
                    layer.alert('操作失败', {icon: 5});
                }
            }
        });
    }else{
        form.css("height","35rem");
    }
}

function deleteWork(id) {
    $.ajax({
        type: "POST",
        url: ctx+"/workExperience/deleteById.do",
        data: {'id':id},
        dataType: "json",
        success: function (data) {
            if (data == '1') {
                $("#work_"+id).remove();
            } else {
                layer.alert('操作失败', {icon: 5});
            }
        }
    });
}

//加载工作经验
function loadWork(datas){
    for(var i = 0; i < datas.length;i++){
        var data = datas[i];
        var experienceDiv = $("#experienceDiv");//工作经验div
        var workForm = $("<form style='height: 28rem' id='work_"+data.workExperienceId+"'></form>").addClass("form-horizontal").addClass("bottomBorder");//表单
        //鼠标放上去变橙色
        workForm.bind("mouseover",function () {
            $(this).removeClass("bottomBorder");
            $(this).addClass("orangeBorder");
        })
        //移出去变回无颜色
        workForm.bind("mouseout",function () {
            $(this).removeClass("orangeBorder");
            $(this).addClass("bottomBorder");
        })

        workForm.append("<input type='hidden' name='workExperienceId'>");
        workForm.append("<input type='hidden' name='resumeInfoId' value='"+$("#resumeInfoId").val()+"'>");

        //第一行
        var firstDiv = $('<div class="form-group" style="margin-top:15px"></div>');
        //公司
        var company = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="company">公司<span'+
            ' style="color: red">*</span></label>'+
            '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
            '<input type="text" class="form-control"  name="company" required="required">'+
            '</div>');
        firstDiv.append(company);
        //职位
        var job = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="job">职位<span'+
            ' style="color: red">*</span></label>'+
            '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
            '<input type="text" class="form-control"  name="job" required="required">'+
            '</div>');
        firstDiv.append(job);
        //开始时间
        var startTime = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="startTime">开始日期<span'+
            ' style="color: red">*</span></label>'+
            '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
            '<input type="text"  name="startTime" class="form_datetime form-control" required="required">'+
            '</div>');
        startTime.find("input").datetimepicker({
            format: 'yyyy-mm-dd', /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
            language: 'zh-CN',
            minView: "month"
        });
        firstDiv.append(startTime);
        workForm.append(firstDiv);

        //第二行
        var secondDiv = $('<div class="form-group" style="margin-top:15px"></div>');
        //结束时间
        var endTime = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="endTime">结束日期<span'+
            ' style="color: red">*</span></label>'+
            '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
            '<input type="text"  name="endTime" class="form_datetime form-control" required="required">'+
            '</div>');
        endTime.find("input").datetimepicker({
            format: 'yyyy-mm-dd', /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
            language: 'zh-CN',
            minView: "month"
        });
        secondDiv.append(endTime);

        workForm.append(secondDiv);

        //第三行
        var thirdDiv = $('<div class="form-group" style="margin-top:15px"></div>');
        //职责
        var description = '<label class="control-label col-sm-1">职责：<span style="color: red">*</span></label>'+
            '<div class="col-sm-8" style="width: 20%;padding: 5px"> <textarea required="required" name="description" class="form-control" style="resize: none;" ></textarea> </div>';
        thirdDiv.append(description);

        workForm.append(thirdDiv);
        //第四行
        var fourthDiv = $('<div class="form-group" style="margin-top:15px"  name="fourthDiv"></div>');
        var btn = '<div class="col-sm-4" style="text-align:left;float: none;margin: 0 auto" name="btnDiv">'+
            '<button  type="button" style="margin-left:50px;display: none"  name="saveExperienceBtn" class="btn btn-primary" onclick="saveWork()">保存</button>'+
            '<button  type="button" style="margin-left:50px;display: none" name="cancelExperienceBtn" class="btn btn-primary" onclick="hideExperienceView(false)">取消</button>'+
            '<button  type="button" style="margin-left:50px;" name="editExperienceBtn" class="btn btn-primary" onclick="showExperienceView('+data.workExperienceId+')">编辑</button>'+
            '<button  type="button" style="margin-left:50px" name="deleteExperienceBtn" class="btn btn-primary" onclick="deleteWork('+data.workExperienceId+')">删除</button>'+
            '</div>';
        fourthDiv.append(btn);

        workForm.append(fourthDiv);
        //加载数据
        for(var name in data){
            if(workForm.find("input[name="+name+"]")){
                workForm.find("input[name="+name+"]").val(data[name]);
            }
        }

        //只读
        workForm.find("input,textarea").attr("disabled",true);
        workForm.find("textarea").val(data.description);
        experienceDiv.prepend(workForm);
    }
}


//技能

function ableNewSkill() {
    if(!$("#skill_modify") || $("#skill_modify").length==0){
        if (!$("#newSkill").data("events")) {
            $("#newSkill").removeClass("unableNewBtn");
            $("#newSkill").addClass("newBtn");
            $("#newSkill").bind("click",newSkill);
        } else {
            if(!$("#newSkill").data("events")["click"]) {
                $("#newSkill").removeClass("unableNewBtn");
                $("#newSkill").addClass("newBtn");
                $("#newSkill").bind("click",newSkill);
            }
        }
    }

}
function disabledNewSkill() {
    $("#newSkill").removeClass("newBtn");//新增标签置灰
    $("#newSkill").addClass("unableNewBtn");
    $("#newSkill").unbind("click");

}

//新增技能
function newSkill(){
    disabledNewSkill();
    var skillDiv = $("#skillDiv");//个人技能div
    var skillForm = $("<form style='height: 12rem' id='skill_modify'></form>").addClass("form-horizontal").addClass("bottomBorder");//表单
    //鼠标放上去变橙色
    skillForm.bind("mouseover",function () {
        $(this).removeClass("bottomBorder");
        $(this).addClass("orangeBorder");
    })
    //移出去变回无颜色
    skillForm.bind("mouseout",function () {
        $(this).removeClass("orangeBorder");
        $(this).addClass("bottomBorder");
    })

    skillForm.append("<input type='hidden' name='skillInfoId'>");
    skillForm.append("<input type='hidden' name='resumeInfoId' value='"+$("#resumeInfoId").val()+"'>");

    //第一行
    var firstDiv = $('<div class="form-group" style="margin-top:15px"></div>');
    //技能名称
    var skillName = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="skillName">技能<span'+
        ' style="color: red">*</span></label>'+
        '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
        '<input type="text" class="form-control"  name="skillName" required="required">'+
        '</div>');
    firstDiv.append(skillName);

    //掌握程度
    var skillAbility = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="skillAbility">掌握程度<span'+
        ' style="color: red">*</span></label>'+
        '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
        '<select id="skillAbility" name="skillAbility" class="form-control">'+
         '   <option value="1">一般</option>'+
        '   <option value="2">熟练</option>'+
        '   <option value="3">精通</option>'+
        '</select>'+
        '</div>');
    firstDiv.append(skillAbility);
    skillForm.append(firstDiv);

    //第二行
    var secondDiv = $('<div class="form-group" style="margin-top:15px"  name="secondDiv"></div>');
    var btn = '<div class="col-sm-4" style="text-align:left;float: none;margin: 0 auto" name="btnDiv">'+
        '<button  type="button" style="margin-left:50px"  name="saveSkillBtn" class="btn btn-primary" onclick="saveSkill()">保存</button>'+
        '<button  type="button" style="margin-left:50px" name="cancelSkillBtn" class="btn btn-primary" onclick="hideSkillView(true)">取消</button>'+
        '<button  type="button" style="margin-left:50px;display: none" name="editSkillBtn" class="btn btn-primary">编辑</button>'+
        '<button  type="button" style="margin-left:50px;display: none" name="deleteSkillBtn" class="btn btn-primary">删除</button>'+
        '</div>';
    secondDiv.append(btn);

    skillForm.append(secondDiv);

    skillDiv.prepend(skillForm);

}

/**
 * 取消保存
 * @param selector 选择器
 * @param isDestroy 是否销毁
 */
function hideSkillView(isDestroy){

    var id = $("#skill_modify").find("input[name='skillInfoId']").val();
    if(isDestroy){
        $("#skill_modify").remove();
    }else{
        //隐藏保存跟取消按钮
        $("#skill_modify").find("button[name='saveSkillBtn']").hide();
        $("#skill_modify").find("button[name='cancelSkillBtn']").hide();
        var modifyBtn = $("#skill_modify").find("button[name='editSkillBtn']");//编辑按钮
        modifyBtn.show();
        modifyBtn.bind("click",function () {
            showSkillView(id);
        });//绑定编辑事件

        var deleteBtn = $("#skill_modify").find("button[name='deleteSkillBtn']");//删除按钮
        deleteBtn.show();
        deleteBtn.bind("click",function () {
            deleteSkill(id);
        });//绑定编辑事件
        //只读
        $("#skill_modify").find("input,select").attr("disabled",true);
        //修改表单的id
        $("#skill_modify").attr("id","skill_"+id);
    }
    ableNewSkill();
}

/**
 * 显示表单编辑
 * @param formId //表单id
 */
function showSkillView(formId){
    disabledNewSkill();//禁止新增
    $("#skill_" + formId).attr("id","skill_modify");//修改id
    // 隐藏删除跟编辑按钮
    $("#skill_modify").find("button[name='editSkillBtn']").hide();
    $("#skill_modify").find("button[name='deleteSkillBtn']").hide();
    var saveBtn = $("#skill_modify").find("button[name='saveSkillBtn']");//保存按钮
    saveBtn.show();

    var cancelBtn = $("#skill_modify").find("button[name='cancelSkillBtn']");//取消按钮
    cancelBtn.show();
    cancelBtn.bind("click",function(){
        hideSkillView(false);
    });

    $("#skill_modify").find("input,select").attr("disabled",false);
}

//保存技能
function saveSkill(){
    var form = $("#skill_modify");
    if(form.validate().form()){
        form.css("height","12rem");
        var formData =  form.serialize();
        $.ajax({
            type: "POST",
            url: ctx+"/skillInfo/addOrUpdate.do",
            data: formData,
            dataType: "json",
            success: function (data) {
                if (data) {
                    hideEditView();
                    for(var name in data){
                        if(form.find("input[name="+name+"]")){
                            form.find("input[name="+name+"]").val(data[name]);
                        }
                    }
                    //隐藏编辑
                    hideSkillView(false);
                } else {
                    layer.alert('操作失败', {icon: 5});
                }
            }
        });
    }else{
        form.css("height","15rem");
    }
}

function deleteSkill(id) {
    $.ajax({
        type: "POST",
        url: ctx+"/skillInfo/deleteById.do",
        data: {'id':id},
        dataType: "json",
        success: function (data) {
            if (data == '1') {
                $("#skill_"+id).remove();
            } else {
                layer.alert('操作失败', {icon: 5});
            }
        }
    });
}

//加载个人技能
function loadSkill(datas){
    for(var i = 0; i < datas.length;i++){
        var data = datas[i];
        var skillDiv = $("#skillDiv");//个人技能div
        var skillForm = $("<form style='height: 12rem' id='skill_modify'></form>").addClass("form-horizontal").addClass("bottomBorder");//表单
        //鼠标放上去变橙色
        skillForm.bind("mouseover",function () {
            $(this).removeClass("bottomBorder");
            $(this).addClass("orangeBorder");
        })
        //移出去变回无颜色
        skillForm.bind("mouseout",function () {
            $(this).removeClass("orangeBorder");
            $(this).addClass("bottomBorder");
        })

        skillForm.append("<input type='hidden' name='skillInfoId'>");
        skillForm.append("<input type='hidden' name='resumeInfoId' value='"+$("#resumeInfoId").val()+"'>");

        //第一行
        var firstDiv = $('<div class="form-group" style="margin-top:15px"></div>');
        //技能名称
        var skillName = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="skillName">技能<span'+
            ' style="color: red">*</span></label>'+
            '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
            '<input type="text" class="form-control"  name="skillName" required="required">'+
            '</div>');
        firstDiv.append(skillName);

        //掌握程度
        var skillAbility = $('<label style="padding: 10px 0" class="control-label col-sm-1" for="skillAbility">掌握程度<span'+
            ' style="color: red">*</span></label>'+
            '<div class="col-sm-3" style="width: 20%;padding: 5px">'+
            '<select id="skillAbility" name="skillAbility" class="form-control">'+
            '   <option value="1">一般</option>'+
            '   <option value="2">熟练</option>'+
            '   <option value="3">精通</option>'+
            '</select>'+
            '</div>');
        firstDiv.append(skillAbility);
        skillForm.append(firstDiv);

        //第二行
        var secondDiv = $('<div class="form-group" style="margin-top:15px"  name="secondDiv"></div>');
        var btn = '<div class="col-sm-4" style="text-align:left;float: none;margin: 0 auto" name="btnDiv">'+
            '<button  type="button" style="margin-left:50px;display: none"  name="saveSkillBtn" class="btn btn-primary" onclick="saveSkill()">保存</button>'+
            '<button  type="button" style="margin-left:50px;display: none" name="cancelSkillBtn" class="btn btn-primary" onclick="hideSkillView(true)">取消</button>'+
            '<button  type="button" style="margin-left:50px;" name="editSkillBtn" class="btn btn-primary" onclick="showSkillView('+data.skillInfoId+')">编辑</button>'+
            '<button  type="button" style="margin-left:50px" name="deleteSkillBtn" class="btn btn-primary" onclick="deleteSkill('+data.skillInfoId+')">删除</button>'+
            '</div>';
        secondDiv.append(btn);

        skillForm.append(secondDiv);
        //加载数据
        for(var name in data){
            if(skillForm.find("input[name="+name+"]")){
                skillForm.find("input[name="+name+"]").val(data[name]);
            }
        }
        //只读
        skillForm.find("input,select").attr("disabled",true);
        skillForm.find("select").val(data.skillAbility);
        skillDiv.prepend(skillForm);
    }
}