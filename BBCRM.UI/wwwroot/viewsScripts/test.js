var tstJS = {
    Table: {
        ResponseHandler: function (res) {
            debugger;
            if (!res.isSucceeded)
                return;
            return res.data;
        },
     
        OptionsFormatter: function (value, row, index, field) {
            var DeleteBtn = `<a onclick="tstJS.Delete('${row.destinationId}')"  title="Delete" class="btn btn-danger">
                                <span class="fa fa-remove"></span>
                            </a>`
            var RestoreBtn = `<a onclick="tstJS.Restore('${row.destinationId}')"  title="Restore" class="btn btn-purple">
                                <span class="fa fa-undo"></span>
                            </a>`
            return `${DeleteBtn}`;
        },

        Refresh: function () {
            $("#AssigmentTbl").bootstrapTable('refresh', {});
        }
    },
    Delete: function (id) {
        swal({
            title: "Are you sure?",
            text: "To Delete this item!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function () {
            Ajax.SendRequest("/delete/" + id , Ajax.Type.Delete, null, function (resp) {
                swal("Deleted!", "This item has been deleted.", "success");
                tstJS.Table.Refresh();
            });
        });
    },
    Restore: function (id) {
        swal({
            title: "Are you sure?",
            text: "To Restore this item!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#615ca8",
            confirmButtonText: "Yes, Restore it!",
            closeOnConfirm: false
        }, function () {
            Ajax.SendRequest("/customer-management/" + id + "?status=" + Enums.Status.Restored, Ajax.Type.Delete, null, function (resp) {
                swal("Restored!", "This item has been restored.", "success");
                tstJS.Table.Refresh();
            });
        });
    },
}