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
        $('#deliverRecord').bootstrapTable({
            url: ctx + '/deliverRecord/getByPage.do',         //请求后台的URL（*）
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
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "deliverRecordId",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            singleSelect    : true,
            detailView: false,                   //是否显示父子表
            columns: [{
                field: 'deliverRecordId',
            },{
                field: 'jobName',
                title: '职位名称'
            }, {
                field: 'hireNum',
                title: '招聘人数'
            }, {
                field: 'requirement',
                title: '需求'
            },{
                field: 'status',
                title: '状态',
                formatter:statusFormatter
            }, {
                field: 'createdTime',
                title: '发布时间'
            }, {
                field: 'name',
                title: '投递人'
            }, {
                field: 'deliverTime',
                title: '投递时间'
            }/*, {
                field: 'userId',
                title: '发布企业'
            }*/, {
                field: 'cancelDeliver',
                title: '取消投递',
                formatter:cancelDeliver
            },{
                field: 'resumeDetail',
                title: '查看简历',
                formatter:detailFormatter
            },]
        });
        $('#deliverRecord').bootstrapTable('hideColumn', 'deliverRecordId');
        //企业，隐藏取消投递按钮
        if(userType == 3){
            $('#deliverRecord').bootstrapTable('hideColumn', 'cancelDeliver');
        }
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            jobInfoId: $("#jobInfoId").val(),
            userId: $("#userId").val()
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
            $("#deliverRecord").bootstrapTable('refresh');
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

function newJob(){
    $("#subForm")[0].reset();
    layer.open({
        type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
        area: ['50%', '7	0%'],//控制层宽高 [宽度, 高度]
        content: $("#inputDiv"),
        offset: ['100px', '300px'],
        title: '新增',
        scrollbar: false
    });
}

function deleteByID(deliverRecordId){

    if(confirm("您确定要取消吗?")){
        $.ajax({
            type: "POST",
            url: ctx+"/deliverRecord/deleteById.do",
            data: {'id':deliverRecordId},
            dataType: "json",
            success: function (data) {
                if (data == '1') {
                    layer.alert('操作成功', {icon: 6});
                    closeAllLayer();
                    $("#deliverRecord").bootstrapTable('refresh');
                } else {
                    layer.alert('操作失败', {icon: 5});
                }
            }
        });
    }
}

function cancelDeliver(value,rowData,index){
    return "<a style='color: blue;cursor: pointer;' onclick='deleteByID("+rowData.deliverRecordId+")'>取消投递</a>";
}


function detailFormatter(value,rowData,index) {
    return "<a style='color: blue;cursor: pointer;' onclick='openDetail("+rowData.resumeInfoId+")'>详情</a>";
}
function openDetail(id) {
    window.location.href=ctx+"/resumeInfo/editResume.do?isDetail=true&id=" + id
}