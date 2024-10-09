<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exc_popuppage.aspx.cs" Inherits="WCP_Calculation.Exc_popuppage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>
    <link href="KMI%20Styles/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="KMI%20Styles/assets/css/footable.min.css" rel="stylesheet" type="text/css" />
    <link href="KMI Styles/assets/css/KMI.css" rel="stylesheet" type="text/css" />
    <link href="KMI Styles/assets/css/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="KMI Styles/assets/jqueryCalendar/jquery-ui.css" rel="stylesheet"
        type="text/css" />
    <link href="assets/KMI%20Styles/Bootstrap/datepicker/bootstrap-datepicker.css"
        rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <style>
        .divspecial {
              background-color: #ddd;
              border: none;
              color: black;
              padding: 10px 10px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              margin: 4px 2px;
              /*cursor: pointer;*/
              border-radius: 16px;
            }
         .modal,.modal1 {
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
        .modal-content,.modal-content1 {
            background-color: #fefefe;
            margin: 5% auto; /* 15% from the top and centered */
            padding: 15px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            /*height:63%;*/
        }
        /* Close button */
        .close,.close1 {
            color: red;
            /*background-color:red;*/
            float: right;
            font-size: 28px;
            font-weight: bold;
            /*margin:2px 2px 2px 2px;*/
        }
        .AltScym_cls_{
            /*color:#fd0101;*/
            text-align:right;
            /*padding:1px 1px 1px 1px;
            margin:1px -31px 2px 1px;*/
           
        }
        .close:hover,.close:focus,.close1:hover,.close1:focus {
            color: red;
            /*background-color:white;*/
            text-decoration: none;
            cursor: pointer;
        }
        

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="Div6" runat="server" class="panel-heading" onclick="ShowReqDtl1('divIntRul','ImgDetails');return false;">
        <div class="row">
              <div class="col-sm-10" style="text-align: left">
                  <asp:Label ID="Label28" Text="Excel Upload" runat="server" Font-Size="19px" />
              </div>
              <div class="col-sm-2">
                  <span id="ImgDetails" class="glyphicon glyphicon-menu-hamburger" style="float: right; color: #034ea2; padding: 1px 10px ! important; font-size: 18px;"></span>
              </div>
        </div>
        </div>

        <div id="divIntRul" runat="server" style="padding: 25px;" class="panel-body">
				  <div id="div3" runat="server" class="row">
					  <div class="col-sm-4" style="text-align: left">
						  <asp:CheckBox Id="ChkOne" runat="server" AutoPostBack="true" OnCheckedChanged="ChkOne_CheckedChanged"/>
<%--					  </div>
					  <div class="col-sm-3" style="text-align: left">--%>
						  <asp:Label ID="lblText" runat="server" Text="Do you want the append the data to previous upload?"></asp:Label>
					  </div>
				  </div>

				  <div id="div1" runat="server" class="row">
					  <div id="div4" runat="server" class="col-sm-3" style="text-align: left;display:none">
						  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Excel 1" Value="2"></asp:ListItem>
                                <%--<asp:ListItem Text="Excel 2" Value="3"></asp:ListItem>--%>
						  </asp:DropDownList>
					  </div>
					  <div class="col-sm-5" style="text-align: left">
						  <asp:FileUpload ID="FileUpload1" Width="100%" class="form-control" runat="server"  />
					  </div>
					  <div class="col-sm-3" style="text-align: left">
                        <asp:LinkButton ID="btn_Upload" runat="server" CssClass="btn btn-sample" TabIndex="32" 
                          ><%--OnClick="btn_Upload_Click"--%> 
                        <span class="glyphicon glyphicon-upload" style="color:white"></span> Upload
                        </asp:LinkButton>
					  </div>
				  </div>
                <div id="Div38" runat="server" style="display:block" class="row">
                    <div id="divExcel1" class="divspecial">Excel 1</div>
                    <div id="divExcel2" class="divspecial">Excel 2</div>
                    <div id="divExcel3" class="divspecial">Excel 3</div>
                </div>
                 
                    <!-- The Modal -->
                    <div id="myModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                      <span class="close">&times;</span>              
                      <%--<asp:GridView ID="GridView2" class="footable" runat="server"></asp:GridView> --%>

                      <asp:GridView ID="GridView2" runat="server" CssClass="footable" PageSize="10" AllowSorting="True"
                                     AllowPaging="true" AutoGenerateColumns="false" ForeColor="#333333" EmptyDataText="No Standard definition type Defined">
                                    <RowStyle CssClass="GridViewRow"></RowStyle>
                                    <PagerStyle CssClass="disablepage" />
                                    <HeaderStyle CssClass="gridview th" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" HeaderStyle-HorizontalAlign="Left"
                                            SortExpression="ACT_TYP_DSC">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstddeftyp" runat="server" Text='<%# Bind("Uno")%>'></asp:Label>
                                                <asp:HiddenField ID="hdnstddeftyp" runat="server" Value='<%# Bind("Uno")%>'>
                                                </asp:HiddenField>
                                                <asp:HiddenField ID="hdnkpicodestddef" runat="server" Value='<%# Bind("Uno")%>'>
                                                </asp:HiddenField>
                                            </ItemTemplate>
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Login" HeaderStyle-HorizontalAlign="Left" SortExpression="BSD_ON_TBL_TYP">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbsdtbltyp" runat="server" Text='<%# Bind("Login")%>'></asp:Label>
                                                <asp:HiddenField ID="hdnbsdtbltyp" runat="server" Value='<%# Bind("Login")%>' />
                                                  <asp:Label ID="lblhdnbsdontbltype" runat="server" Text='<%# Bind("Login")%>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Login_ID" HeaderStyle-HorizontalAlign="Left" SortExpression="STATUS">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstddeftypstatus" runat="server" Text='<%# Bind("Login_ID")%>'></asp:Label>
                                                <asp:HiddenField ID="hdnstddeftypstatus" runat="server" Value='<%# Bind("Login_ID")%>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password" HeaderStyle-HorizontalAlign="Left" SortExpression="EFF_DTIM">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstddeftypffdt" runat="server" Text='<%# Bind("Password")%>'></asp:Label>
                                                <asp:HiddenField ID="hdnstddeftypffdt" runat="server" Value='<%# Bind("Password")%>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Com_Pass" HeaderStyle-HorizontalAlign="Left" SortExpression="CSE_DTIM">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstddeftypcsedt" runat="server" Text='<%# Bind("Com_Pass")%>'></asp:Label>
                                                <asp:HiddenField ID="hdnstddeftypcsedt" runat="server" Value='<%# Bind("Com_Pass")%>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                </asp:GridView>


                    </div>
                    </div>
              </div>


        <div id="Div7" runat="server" class="panel-heading" onclick="ShowReqDtl1('div2','ImgDetails1');return false;">
        <div class="row">
              <div class="col-sm-10" style="text-align: left">
                  <asp:Label ID="Label1"  Text="Scheme Key Creation" runat="server" Font-Size="19px" />
              </div>
              <div class="col-sm-2">
                  <span id="ImgDetails1" class="glyphicon glyphicon-menu-hamburger" style="float: right; color: #034ea2; padding: 1px 10px ! important; font-size: 18px;"></span>
              </div>
        </div>
        </div>


           <div id="div2" runat="server" style="padding: 25px" class="panel-body">
            <div  style="text-align:center">
              <asp:LinkButton ID="lnkcrtsrctbl" runat="server" Enabled="false" ToolTip="Add Scheme Key" >
                  <%--OnClick="lnkcrtsrctbl_Click"--%>
               <%--<asp:Label ID="Label1" runat="server" Style="color:black" Text="Add Scheme Key"></asp:Label>  --%>                 
		      <img class="Plus_cls" src="images/icons8-add-64.png" alt="Create Source" style="height:17px"/>
              </asp:LinkButton>
            </div>
               <div id="Div5" runat="server" style="display:block" class="row">
               <div id="div_Schem" class="divspecial">NON-Par Others
                   <div class="AltScym_cls_">
                       <asp:LinkButton class="Edit_cls" ID="Edit_ID" runat="server" ToolTip="Edit Scheme Key">
                           <i class='bx bxs-edit-alt'></i>
                       </asp:LinkButton>
                       <asp:LinkButton ID="Show_ID" runat="server" ToolTip="Show Scheme Key" >
                       <i class='bx bx-show'></i>
                       </asp:LinkButton>
                       <asp:LinkButton ID="Rate" runat="server" ToolTip="Rate Setup" >
                       <B>%</B>
                       </asp:LinkButton>
                   </div>
               </div>

               <div id="div_Schem1" class="divspecial">Renewal Persistancy
                   <div class="AltScym_cls_">
                       <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Edit Scheme Key" >
                           <i class='bx bxs-edit-alt'></i>
                       </asp:LinkButton>
                       <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="Show Scheme Key" >
                       <i class='bx bx-show'></i>
                       </asp:LinkButton>
                       <asp:LinkButton ID="LinkButton3" runat="server" ToolTip="Rate Setup" >
                       <B>%</B>
                       </asp:LinkButton>
                   </div>
               </div>
              
               <div id="div_Schem3" class="divspecial">Variable Fee
                   <div class="AltScym_cls_">
                       <asp:LinkButton ID="LinkButton4" runat="server" ToolTip="Edit Scheme Key" >
                           <i class='bx bxs-edit-alt'></i>
                       </asp:LinkButton>
                       <asp:LinkButton ID="LinkButton5" runat="server" ToolTip="Show Scheme Key" >
                       <i class='bx bx-show'></i>
                       </asp:LinkButton>
                       <asp:LinkButton ID="LinkButton6" runat="server" ToolTip="Rate Setup" >
                       <B>%</B>
                       </asp:LinkButton>
                   </div>
               </div>
                    
                        <!-- The Modal -->
            <div id="myModal1" class="modal1">
            <!-- Modal content -->
            <div class="modal-content">
              <span class="close1">&times;</span>              
                      
            <div id="div8" runat="server" style="width: 97%;" class="panel">
            <div id="divRprtPanelHeading" runat="server" class="panel-heading" onclick="ShowReqDtl1('divRprtPanelBody','myImg');return false;">
                <div class="row">
                    <div class="col-sm-10" style="text-align: left">
                        <asp:Label ID="lbldtls" Text="Scheme Setup" Font-Size="19px" runat="server" />
                    </div>
                    <div class="col-sm-2">
                             <span id="myImg" class="glyphicon glyphicon-menu-hamburger" style="float: right;color:#034ea2;
                            padding: 1px 10px ! important; font-size: 18px;"></span> <%--added by ajay sawant 24/4/2018--%>

                    </div>
                </div>
            </div>
         <%--  <asp:updatepanel runat="server">
               <contenttemplate>--%>
                     <div id="divRprtPanelBody" runat="server" style="width: 96%;" class="panel-body">
                <div class="row" style="margin-bottom: 5px;">
                    <%--<div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblrulNo" Text="Action Number" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">
                       <asp:TextBox ID="txtrulNo" runat="server" Enabled="false" CssClass="form-control"  placeholder="Action Number" />
                    </div>--%>

                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblactschno" Text="Action Scheme No" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">
                       <asp:TextBox ID="txtactschno" runat="server" Enabled="false" CssClass="form-control"  placeholder="Action Scheme No" />
                    </div>

                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="Label2" Text="Action Category description" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                     <div class="col-sm-3" >
                       <asp:TextBox ID="TextBox1" runat="server" Enabled="true" CssClass="form-control"  placeholder="Action Category Description" />
                    </div>

                    <%--<div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblactver" Text="Action Version" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">
                       <asp:TextBox ID="txtactver" runat="server"  Enabled="false" CssClass="form-control" Text="1.00"  placeholder="Action Version" />
                    </div>--%>

                <%--    <div id="divrate" style="display:none;">
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblrating" Text="Rating" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                     <div class="col-sm-3">--%>
                        <%--<asp:UpdatePanel ID="UpdatePanel11" runat="server">
                            <ContentTemplate>--%>
                                <%--<asp:DropDownList ID="ddlrating" runat="server" AutoPostBack="true" onmouseup="bindValFactor()" onmousedown="bindValFactor()"  CssClass="select2-container form-control"
                                    TabIndex="4">
                                </asp:DropDownList>--%>
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    <%--</div>
                    </div>--%>
                </div>

                <div class="row" style="margin-bottom: 5px;">
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblfixfactors" Text="Fix factors" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">

                        <asp:ListBox ID="lstfixfactors" runat="server" class="select2-container form-control"  rows="1" cols="20" 
                            SelectionMode="Multiple"></asp:ListBox>
                    </div>
                     <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblrangeFactors" Text="Range factors" runat="server" CssClass="control-label" />
                         <%--<span style="color: red;">*</span>--%>
                    </div>
                    <div class="col-sm-3">
                        <asp:ListBox  ID="lstrangeFactors" runat="server" class="select2-container form-control" rows="1" cols="20" 
                            SelectionMode="Multiple"></asp:ListBox>                        
                    </div>                    
                     
                </div>

                <div class="row" style="margin-bottom: 5px;">
                    <%--<div class="col-sm-3 col-md-3" style="text-align: left"></div>--%>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtareaFixfactor" style="overflow:auto;resize:none" rows="2" cols="20" runat="server" placeholder="Fix Factors" Enabled="false" TextMode="MultiLine" CssClass="form-control"  />
                    </div>
                    <%--<div class="col-sm-3 col-md-3" style="text-align: left"></div>--%>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtareaRangefactor" style="overflow:auto;resize:none" rows="2" cols="20" runat="server" placeholder="Range Factors" Enabled="false" TextMode="MultiLine" CssClass="form-control"  />
                    </div>
                </div>

                <div class="row" style="margin-bottom: 5px;">
                    <%--<div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblvaluefactors" Text="Value Factors" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>--%>
                    <div class="col-sm-6" >
                       <asp:TextBox ID="txtvaluefactors" runat="server" Enabled="false" style="overflow:auto;resize:none" rows="2" cols="20" TextMode="MultiLine"  CssClass="form-control"  placeholder="Value Factors" />
                    </div>

                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblschmKey" Text="Action Scheme Key" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                     <div class="col-sm-3" >
                       <asp:TextBox ID="txtschmKey" runat="server" Enabled="false" CssClass="form-control"  placeholder="Action Scheme Key" />
                    </div>

                    <%--<div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblactbehtyp" Text="Action Behaviour Type" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">                        
                                <asp:DropDownList ID="ddlactbehtyp" runat="server" AutoPostBack="true"  CssClass="select2-container form-control"
                                    TabIndex="4">
                                </asp:DropDownList>                            
                    </div>--%>                     
                </div>

               <%-- <div class="row" style="margin-bottom: 5px;">
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblEffDFrom" Text="Effective Date" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">                        
                                <asp:TextBox ID="txtEffDFrom" runat="server" CssClass="form-control"   onclick="callEffectiveDate()"
                                     placeholder="DD/MM/YYYY" />            
                    </div>
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblEffDTo" Text="Cease Date" runat="server" CssClass="control-label" />                       
                    </div>
                    <div class="col-sm-3">                        
                                <asp:TextBox ID="txtEffDTo" runat="server"  CssClass="form-control" onclick="callCeaseDate()"  placeholder="DD/MM/YYYY" />
                    </div>
                </div>--%>

                <%--<div class="row" style="margin-bottom: 5px;">
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblexcOrdr" Text="Execution Order" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">                        
                                <asp:TextBox ID="txtExecOrder" runat="server" Enabled="false" CssClass="form-control" />
                    </div>
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblstatus" Text="Status" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">
                                <asp:DropDownList ID="ddlstatus" runat="server" AutoPostBack="true"  CssClass="select2-container form-control"
                                    TabIndex="4">
                                </asp:DropDownList>
                    </div>
                </div>--%>

               
                <%--<div class="row" style="margin-bottom: 5px;">
                    
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblactcatgdesc" Text="Action Category description" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                     <div class="col-sm-3" >
                       <asp:TextBox ID="txtactcatgdesc" runat="server" Enabled="true" CssClass="form-control"  placeholder="Action Category Description" />
                    </div>
                    <div class="col-sm-3" style="text-align: left">
                        <asp:Label ID="lblIsPrnt" Text="Is Parent" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlIsPrnt" runat="server" CssClass="select2-container form-control" TabIndex="4"></asp:DropDownList>                    
                    </div>
                </div>--%>

                 <%--<div class="row" style="margin-bottom: 5px;">                    
                    <div class="col-sm-3" style="text-align: left">                        
						<asp:Label ID="Label2" Text="Scheme Type" runat="server" CssClass="control-label" />
                        <span style="color: red;">*</span>
                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlWeightagesTyp" runat="server" CssClass="select2-container form-control" TabIndex="4"></asp:DropDownList>                    
                    </div>
                </div>--%>
<%--Added by Rajkapoor on  09-02-2022 end--%>


                <div class="row" style="margin-top: 12px;">
                    <div class="col-sm-12" align="center">
                        <%--<asp:UpdatePanel ID="UpdatePanel15" runat="server">
                            <ContentTemplate>--%>
                                <%--<asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-sample" OnClick="lnkSave_Click" OnClientClick="fnValidate()">
                                    <span class="glyphicon glyphicon-erase BtnGlyphicon"></span> Save
                                </asp:LinkButton>--%>
                                
                                <button class="btn btn-sample onhover" runat="server" type="button" style="display:none;" id="btnUpdate" onclick="fnValidate()">
                                    <span class="glyphicon glyphicon-floppy-disk" style="color:white;"></span> Update
                                </button>
                                <button class="btn btn-sample onhover" runat="server" type="button"  style="display:inline-block;" id="btnSave" onclick="return fnValidate();">
                                    <span class="glyphicon glyphicon-floppy-disk" style="color:white;"></span> Save
                                </button>
                                <asp:LinkButton ID="lnkCancel" runat="server" CssClass="btn btn-sample onhover" >
                                    <%-- OnClick="lnkCancel_Click"--%>
                                    <span class="glyphicon glyphicon-remove BtnGlyphicon"></span> Cancel
                                </asp:LinkButton>

                                <%-- <asp:LinkButton ID="btnResetExecOrder" OnClientClick="openPopup(); return false" runat="server" CssClass="btn btn-sample" TabIndex="18">
                        <span class="glyphicon glyphicon-edit" style="color:White"></span>                         
                         Modify Execution order
                                </asp:LinkButton>
                                 <asp:Button ID="btnqual" runat="server" ClientIDMode="Static" Style="display: none;"/>                                
                                 <asp:LinkButton ID="btnCopyScheme" OnClientClick="OpenCpySchPopUp(); return false" runat="server" CssClass="btn btn-sample" TabIndex="18">
                        <span class="glyphicon glyphicon-copy" style="color:White"></span> 
                                     Copy Scheme
                                     </asp:LinkButton>--%>

                                  <asp:LinkButton ID="btnRefreshCopyScheme" OnClientClick="OpenCpySchPopUp(); return false" runat="server" CssClass="btn btn-sample" TabIndex="18" Style="display:none;">
                        <span class="glyphicon glyphicon-refresh" style="color:White;"></span> 
                                     Refresh Scheme
                                     </asp:LinkButton>
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>
<%--               </contenttemplate>
            </asp:updatepanel>--%>
            
        </div>



             </div>
             </div>

             </div>
                </div>
           
        <div id="Div9" runat="server" class="panel-heading" onclick="ShowReqDtl1('div10','ImgDetails2');return false;">
        <div class="row">
              <div class="col-sm-10" style="text-align: left">
                  <asp:Label ID="Label3" Text="Batch Run" runat="server" Font-Size="19px" />
              </div>
              <div class="col-sm-2">
                  <span id="ImgDetails2" class="glyphicon glyphicon-menu-hamburger" style="float: right; color: #034ea2; padding: 1px 10px ! important; font-size: 18px;"></span>
              </div>
        </div>
        </div>

        <div id="div10" runat="server" style="padding: 25px;" class="panel-body">
            
           <asp:GridView ID="GridView1" runat="server" CssClass="footable" PageSize="10" AllowSorting="True"
              AllowPaging="true" AutoGenerateColumns="false" ForeColor="#333333" EmptyDataText="No Standard definition type Defined">
             <RowStyle CssClass="GridViewRow"></RowStyle>
             <PagerStyle CssClass="disablepage" />
             <HeaderStyle CssClass="gridview th" />
             <Columns>
                 <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left"
                     SortExpression="ACT_TYP_DSC">
                     <ItemTemplate>
                         <asp:Label ID="lblstddeftyp" runat="server" Text='<%# Bind("ID")%>'></asp:Label>
                         <asp:HiddenField ID="hdnstddeftyp" runat="server" Value='<%# Bind("ID")%>'>
                         </asp:HiddenField>
                         <asp:HiddenField ID="hdnkpicodestddef" runat="server" Value='<%# Bind("ID")%>'>
                         </asp:HiddenField>
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="Left" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Excel_File" HeaderStyle-HorizontalAlign="Left" SortExpression="BSD_ON_TBL_TYP">
                     <ItemTemplate>
                         <asp:Label ID="lblbsdtbltyp" runat="server" Text='<%# Bind("Excel_File")%>'></asp:Label>
                         <asp:HiddenField ID="hdnbsdtbltyp" runat="server" Value='<%# Bind("Excel_File")%>' />
                           <asp:Label ID="lblhdnbsdontbltype" runat="server" Text='<%# Bind("Excel_File")%>' Visible="false"></asp:Label>
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="Left" />
                     <HeaderStyle HorizontalAlign="left" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Run" HeaderStyle-HorizontalAlign="Right" SortExpression="STATUS">
                     <ItemTemplate>
                         <asp:LinkButton ID="lblstddeftypstatus" runat="server" Enabled="false" ToolTip="Run File" >
                             <div style="text-align:center">                              
                             <i class='bx bxs-right-arrow'></i>
                             </div>
                         </asp:LinkButton>                                               
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="center" />
                     <HeaderStyle HorizontalAlign="left" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="downlode" HeaderStyle-HorizontalAlign="Left" SortExpression="EFF_DTIM">
                     <ItemTemplate>                         
                         <asp:LinkButton ID="lblstddeftypffdt" runat="server" Enabled="false" ToolTip="Downlode File" >
                             <div style="text-align:center">
                             <i class='bx bxs-download'></i>
                             </div>
                        </asp:LinkButton>                                               
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="Left" />
                     <HeaderStyle HorizontalAlign="left" />
                 </asp:TemplateField>                 
                                  
                 </Columns>
                 </asp:GridView>  
        

        <div style="text-align:center; padding:12px;">
            <asp:LinkButton  style="width:50px" ID="LinkButton7" runat="server" ToolTip="Run All" >
                 <i class='bx bx-right-arrow' ></i>     
            </asp:LinkButton>
        </div>
        </div>
      
        <div id="Div11" runat="server" class="panel-heading" onclick="ShowReqDtl1('div12','ImgDetails3');return false;">
        <div class="row">
              <div class="col-sm-10" style="text-align: left">
                  <asp:Label ID="Label4" Text="Error Log" runat="server" Font-Size="19px" />
              </div>
              <div class="col-sm-2">
                  <span id="ImgDetails3" class="glyphicon glyphicon-menu-hamburger" style="float: right; color: #034ea2; padding: 1px 10px ! important; font-size: 18px;"></span>
              </div>
        </div>
        </div>

        <div id="div12" runat="server" style="padding: 25px;" class="panel-body">
            
           <asp:GridView ID="GridView3" runat="server" CssClass="footable" PageSize="10" AllowSorting="True"
              AllowPaging="true" AutoGenerateColumns="false" ForeColor="#333333" EmptyDataText="No Standard definition type Defined">
             <RowStyle CssClass="GridViewRow"></RowStyle>
             <PagerStyle CssClass="disablepage" />
             <HeaderStyle CssClass="gridview th" />
             <Columns>
                 <asp:TemplateField HeaderText="Seq-No" HeaderStyle-HorizontalAlign="Left"
                     SortExpression="ACT_TYP_DSC">
                     <ItemTemplate>
                         <asp:Label ID="lblstddeftyp" runat="server" Text='<%# Bind("Seq_No")%>'></asp:Label>
                         <asp:HiddenField ID="hdnstddeftyp" runat="server" Value='<%# Bind("Seq_No")%>'>
                         </asp:HiddenField>
                         <asp:HiddenField ID="hdnkpicodestddef" runat="server" Value='<%# Bind("Seq_No")%>'>
                         </asp:HiddenField>
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="Left" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Description" HeaderStyle-HorizontalAlign="Left" SortExpression="BSD_ON_TBL_TYP">
                     <ItemTemplate>
                         <asp:Label ID="lblbsdtbltyp" runat="server" Text='<%# Bind("Description")%>'></asp:Label>
                         <asp:HiddenField ID="hdnbsdtbltyp" runat="server" Value='<%# Bind("Description")%>' />
                           <asp:Label ID="lblhdnbsdontbltype" runat="server" Text='<%# Bind("Description")%>' Visible="false"></asp:Label>
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="Left" />
                     <HeaderStyle HorizontalAlign="left" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Schemekey" HeaderStyle-HorizontalAlign="Left" SortExpression="BSD_ON_TBL_TYP">
                     <ItemTemplate>
                         <asp:LinkButton ID="lblstddeftypstatus" runat="server" Enabled="false" ToolTip="Click hear for ..." >
                             <div style="text-align:center">Click</div>                                 
                         </asp:LinkButton>
                         <%--<asp:Label ID="lblbsdtbltyp" runat="server" Text='<%# Bind("Scheme_key")%>'></asp:Label>--%>
                         <%--<asp:HiddenField ID="hdnbsdtbltyp" runat="server" Value='<%# Bind("Scheme_key")%>' />
                           <asp:Label ID="lblhdnbsdontbltype" runat="server" Text='<%# Bind("Scheme_key")%>' Visible="false"></asp:Label>--%>
                     </ItemTemplate>
                     <ItemStyle Width="20%" HorizontalAlign="Left" />
                     <HeaderStyle HorizontalAlign="left" />
                 </asp:TemplateField>                                  
                                  
                 </Columns>
                 </asp:GridView>  
        
        </div>
    </form>
</body>
    <script>
        // Get the modal
        var modal = document.getElementById("myModal");
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks on the div, open the modal
        
        document.querySelector('.divspecial').addEventListener('click', function() {
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


        var modal1 = document.getElementById("myModal1");
        
        // Get the <span> element that closes the modal
        var span1 = document.getElementsByClassName("close1")[0];
        //Plus click event
         document.querySelector('.Plus_cls').addEventListener('click', function() {
            modal1.style.display = "block";
        });
        
        // When the user clicks on <span> (x), close the modal
        span1.onclick = function() {
          modal1.style.display = "none";
        }
        
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal1) {
            modal1.style.display = "none";
          }
        }

        
        var modal2 = document.getElementById("myModal1");
        
        // Get the <span> element that closes the modal
        var span2 = document.getElementsByClassName("close1")[0];
        //Edit click event
        document.querySelector('.Edit_cls').addEventListener('click', function () {
            debugger;
            modal2.style.display = "block";
        });
            debugger;
        // When the user clicks on <span> (x), close the modal
        span2.onclick = function() {
          modal2.style.display = "none";
        }
           debugger;
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal2) {
            modal2.style.display = "none";
          }
        }


        
        function ShowReqDtl1(divName, btnName) {
            debugger;
            try {
                var objnewdiv = document.getElementById(divName)
                var objnewbtn = document.getElementById(btnName);
                if (objnewdiv.style.display == "block") {
                    objnewdiv.style.display = "none";
                    //objnewbtn.className = 'glyphicon glyphicon-collapse-up'
                }
                else {
                    objnewdiv.style.display = "block";
                    //objnewbtn.className = 'glyphicon glyphicon-collapse-down'
                }
            }
            catch (err) {
                ShowError(err.description);
            }
        }

    </script>
</html>
