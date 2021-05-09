<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo2.aspx.cs" Inherits="GridViewFixHeader.Demo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery-3.6.0.min.js"></script>
    <style>
    #header {
        position: fixed;
        top: 0px;
        height: 20px;
        width: 100%;
    }
    #content{ 
        margin-top: 20px; 
        height: 300px; 
        overflow: auto; 
    }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            resize();
        });

        $(window).resize(function () {
            //resize();
        });

        function resize() {
            //取得gvContent中Header元素offset Width
            var ContentGrid = document.getElementById("gvContent");
            if (ContentGrid == null) {
                return;
            }
            if (ContentGrid.rows.length < 2) {
                return;
            }
            //first row(Content)
            var ContentGridItemRow = ContentGrid.rows[0];

            //Header
            var HeaderGrid = document.getElementById("gvHeader");
            if (HeaderGrid == null) {
                return;
            }
            if (HeaderGrid.rows.length < 1) {
                return;
            }

            if (HeaderGrid.rows[0].cells.length != ContentGrid.rows[0].cells.length) {
                return;
            }

            //first row(Header)
            var HeaderGridItemRow = HeaderGrid.rows[0];

            //console.log(document.getElementById('gvContent').rows[0].cells[0].offsetWidth)
            //console.log(document.getElementById('gvHeader').rows[0].cells[0].offsetWidth)

            for (var i = 0; i < ContentGridItemRow.cells.length; i++) {
                var td_content = ContentGridItemRow.cells[i];
                var td_header = HeaderGridItemRow.cells[i];
                td_header.width = td_content.offsetWidth;
                td_content.width = td_header.width;
            }
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="header">
                <asp:GridView ID="gvHeader" runat="server" OnRowDataBound="gvHeader_RowDataBound"></asp:GridView>
            </div>
            <div id="content">
                <asp:GridView ID="gvContent" runat="server" OnRowDataBound="gvContent_RowDataBound"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
