<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="File_Upld.aspx.cs" Inherits="WCP_Calculation.File_Upld" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link href="KMI%20Styles/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title></title>
    <style>
    /*div{
        display:block;
    }*/
    .center_cls{
    box-shadow: 0 0 50px red;
    padding:15px;
    margin:2px;
    }
    .chck_cls{
    box-shadow: 0 0 4px Green;
    padding: 15px 20px 15px 20px;
    margin: auto;
    }
    .form_control{
    width: 75%;
    height: 21px;
    padding: 12px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #edcece;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 6px;
    /*webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);*/
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    /*-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;*/
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    display:inline-block;
    }
    .form_control:hover{
        background-color: #ccc;
    }
    .Drp_CLS{
        box-shadow: 0px 2px 4px orange;
        padding: 10px 40px 10px 40px;
        margin: 2px;
        /*width:50%;*/
        display:inline;
    }
    .btn_cls{
        background-color:blue;
        color:white;
        border-style:groove;
        text-align: center;
        width:140px;
        height:40px;
        border-radius:15px;
        padding:9px 45px 9px 45px;
        
    }
    .btn_cls:hover{
        background-color:green;
    }
    .Grid_cls{
        background-color:yellow;
        padding:20px 30px 20px 30px ;
        margin:20px 30px 20px 30px ;
    }
    .div_btn_cls{
        box-shadow: 0px 2px 4px orange;
        padding: 15px 60px 15px 60px;
        margin: 2px;
        /*width:50%;*/
        display:inline;
    }
    .div_Exc_cls{
        background-color:forestgreen;
        width:150px;
        height:40px;
        color:white;
        border-style:groove;
        text-align:center;
        border-radius:15px;
        padding: 2px;
        margin:10px;
    }
    .div_Exc_cls:hover{
        background-color:limegreen;
    }
      /* Styles for modal */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Position it fixed so it doesn't move with the page */
        z-index: 1; /* Make sure it stays on top */
        left: 0;
        top: 0px;
        width: 100%;
        height: 100%;
        overflow: auto; /* Enable scrolling if content exceeds viewport height */
        background-color: rgba(0,0,0,0.4); /* Black with transparency */
    }
    /* Modal content */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto; /* 15% from the top and centered */
        padding: 2px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
        height:30%;
    }
    /* Close button */
    .close {
        color: white;
        background-color:red;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: red;
        background-color:white;
        text-decoration: none;
        cursor: pointer;
    }
    .row {
            display: flex;
    }

    .col {
            flex: 1;
            margin: 5px 5px 5px 5px ;
            padding: 10px 10px 10px 10px;
            border: 1px solid #ccc;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center_cls">
        <div class="chck_cls">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Do you want the append the data to previous upload?"/>              
        </div>            
        <div class="chck_cls">

            <div class="row">
            <div class="col-sm-3">
            <asp:DropDownList Class="Drp_CLS" ID="dropdownList" runat="server">
                <asp:ListItem Text="Option 1" Value="1"></asp:ListItem>
                <asp:ListItem Text="Option 2" Value="2"></asp:ListItem>
                <asp:ListItem Text="Option 3" Value="3"></asp:ListItem>                
            </asp:DropDownList>
            </div>

            <div class="col">
            <div>
            <asp:Label ID="Label1" runat="server" Text="Upload file" ></asp:Label>
            </div>    
            <div class="form_control">
            <asp:FileUpload ID="FileUpload1" runat="server"/>
            </div>
            </div>

            <div class="div_btn_cls"> 
            <a class="btn_cls">
            <i class='bx bx-up-arrow-circle'></i>    
            Upload
            </a>                           
            <%--<asp:Button class="btn_cls" ID="Button1" runat="server" Text="Upload" BorderStyle="Solid" ToolTip="S" />--%>               
            </div>

            </div>

            <!-- The Modal -->
            <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
              <span class="close">&times;</span>              
              <asp:GridView ID="GridView2" class="Grid_cls" runat="server"></asp:GridView> 
            </div>
            </div>

            <div class="div_Exc_cls">
            Excel 1
             <%--<asp:GridView ID="GridView2" runat="server"></asp:GridView> --%>
            </div>
        </div>
        </div>
    </form>
</body>
<script>
        // Get the modal
        var modal = document.getElementById("myModal");
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks on the div, open the modal
        document.querySelector('.div_Exc_cls').addEventListener('click', function() {
            modal.style.display = "block";
        });
        
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
          modal.style.display = "none";
        }
        
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }

</script>
</html>
