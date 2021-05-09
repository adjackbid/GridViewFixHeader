<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="GridViewFixHeader.Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="js/gridviewscroll.js"></script>
    <link href="css/GridViewScroll.css" rel="stylesheet" />
    <script type="text/javascript">
    window.onload = function () {
        var options = new GridViewScrollOptions();
        options.elementID = "gvMain";
        options.width = "100%";
        options.height = 400;
        gridViewScroll = new GridViewScroll(options);
        gridViewScroll.enhance();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="width:550px;height:550px;border:1px solid #CCCCCC;">
            <asp:GridView ID="gvMain" runat="server" style="width:100%;border-collapse:collapse;">
            <HeaderStyle CssClass="GridViewScrollHeader"></HeaderStyle>
            <RowStyle CssClass="GridViewScrollItem"></RowStyle>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
