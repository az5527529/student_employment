$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#resumeInfo').bootstrapTable({
            url: ctx + '/resumeInfo/getByPage.do',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            contentType : "application/x-www-form-urlencoded",
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）

            showColumns: true,                  //是否显示所有的列
            // showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "resumeInfoId",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            singleSelect    : true,
            detailView: false,                   //是否显示父子表
            columns: [ {
                checkbox: true
            },{
                field: 'resumeInfoId',
            },{
                field: 'resumeName',
                title: '简历名称'
            }, {
                field: 'name',
                title: '姓名'
            }, {
                field: 'telephone',
                title: '电话'
            },{
                field: 'major',
                title: '专业',
            }, {
                field: 'school',
                title: '毕业学校'
            }, {
                field: 'graduateTime',
                title: '毕业时间'
            }, {
                field: 'birthday',
                title: '生日'
            }, {
                field: '',
                title: '详情',
                formatter : detailFormatter
            },]
        });
        $('#resumeInfo').bootstrapTable('hideColumn', 'resumeInfoId');
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            resumeName: $("#resumeName").val()
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
        $("#btn_query").bind("click",function(){
            $("#resumeInfo").bootstrapTable('refresh');
        })

    };

    return oInit;
};


function statusFormatter(value,rowData,index){
    if(value == 1){
        return "招聘中";
    }
    if(value == 2){
        return "已结束";
    }
    return "";
}

function newResume(){
    window.location.href=ctx + "/sign/editResume.jsp";
}

function editResume(){
    var datas= $("#resumeInfo").bootstrapTable('getSelections');
    var data = [];
    if(datas.length==1){
        data = datas[0];
    }else{
        layer.alert('请选中需要编辑的行', {icon: 0});
        return;
    }
    window.location.href=ctx+"/resumeInfo/editResume.do?id=" + data.resumeInfoId;
}

function deleteByID(){
    var datas= $("#resumeInfo").bootstrapTable('getSelections');
    var data = [];
    if(datas.length==1){
        data = datas[0];
    }else{
        layer.alert('请选中一条数据', {icon: 0});
        return;
    }
    if(confirm("您确定要删除吗?")){
        $.ajax({
            type: "POST",
            url: ctx+"/resumeInfo/deleteById.do",
            data: {'id':data.resumeInfoId},
            dataType: "json",
            success: function (data) {
                if (data == '1') {
                    layer.alert('操作成功', {icon: 6});
                    closeAllLayer();
                    $("#resumeInfo").bootstrapTable('refresh');
                } else {
                    layer.alert('操作失败', {icon: 5});
                }
            }
        });
    }
}

function detailFormatter(value,rowData,index) {
    return "<a style='color: blue;cursor: pointer;' onclick='openDetail("+rowData.resumeInfoId+")'>详情</a>";
}
function openDetail(id) {
    window.location.href=ctx+"/resumeInfo/editResume.do?isDetail=true&id=" + id
}