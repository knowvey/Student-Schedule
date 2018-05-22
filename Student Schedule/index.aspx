<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Student_Schedule.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WVSU Student Schedule</title>
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="Bootstrap/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Bootstrap/css/index.css" rel="stylesheet" />
    <link href="Bootstrap/css/style.css" rel="stylesheet" />
    <script src="Bootstrap/js/jquery.min.js"></script>
    <script src="Bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <div class="container">
            <h2>WVSU Student Schedule</h2>    
            <div class="pad">          
                <div class="row">
                    <div class="col-sm-6">
                        <h5 class="pad2">Search by: <asp:DropDownList ID="selectDDL" runat="server" OnSelectedIndexChanged="selectDDL_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="studID">Student ID</asp:ListItem>
                            <asp:ListItem Value="section">Section</asp:ListItem>
                            </asp:DropDownList></h5>
                        <asp:Panel ID="searchStudIDPnl" runat="server">
                            <h5>Student ID: 
                            <asp:TextBox ID="sStudIDTB" runat="server"></asp:TextBox><asp:Label ID="sStatusLbl" runat="server" ForeColor="Red" CssClass="pad3"></asp:Label></h5>
                            <asp:Button ID="sStudBtn" runat="server" OnClick="searchBtn_Click" Text="Search" />                        
                        </asp:Panel>
                        <asp:Panel ID="searchSectionPnl" runat="server" Visible="False">
                            <h5>Select Section: <asp:DropDownList ID="sectionListDDL" runat="server"></asp:DropDownList></h5>            
                            <asp:Button ID="sSectionBtn" runat="server" OnClick="searchBtn_Click" Text="Search" />
                        </asp:Panel>
                    </div>                
                    <div class="col-sm-6">
                        <asp:Panel ID="studentInfoPnl" runat="server" CssClass="card" Visible="False">                        
                                <h4>ID: <asp:Label ID="idLbl" runat="server" Text="ID Label"></asp:Label></h4>
                                <h4>Name: <asp:Label ID="nameLbl" runat="server" Text="Name Label"></asp:Label></h4>                
                                <h4>Section: <asp:Label ID="sectionLbl" runat="server" Text="Section Label"></asp:Label></h4>                                        
                        </asp:Panel>
                    </div>
                </div>      
                <asp:Panel ID="gridViewPnl" runat="server" CssClass="table-fill" Visible="False">
                    <h4><asp:DropDownList ID="dayDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dayDDL_SelectedIndexChanged">                    
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Today</asp:ListItem>
                        <asp:ListItem Value="Monday">Monday</asp:ListItem>
                        <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                        <asp:ListItem>Wednesday</asp:ListItem>
                        <asp:ListItem>Thursday</asp:ListItem>
                        <asp:ListItem>Friday</asp:ListItem>
                        <asp:ListItem>Saturday</asp:ListItem>
                        <asp:ListItem>Sunday</asp:ListItem>
                        </asp:DropDownList>                        
                    </h4>
                    <asp:GridView ID="schedGV" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="subj_id" HeaderText="Subject ID" />
                            <asp:BoundField DataField="subject_list" HeaderText="Description" />
                            <asp:BoundField DataField="time" HeaderText="Time" />
                            <asp:BoundField DataField="day" HeaderText="Day" />
                            <asp:BoundField DataField="instructor" HeaderText="Instructor" />
                            <asp:BoundField DataField="room" HeaderText="Room" />
                            <asp:BoundField DataField="stud_section" HeaderText="Section" />
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="gStatus" runat="server"></asp:Label>
                </asp:Panel>        
                <asp:Panel ID="schedTimeTablePnl" runat="server" Visible="False">
                    <asp:Table ID="schedTimeTbl" CssClass="tt_timetable" runat="server">                    
                    <asp:TableHeaderRow CssClass="row_gray">
                        <asp:TableHeaderCell>Time</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Monday</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Tuesday</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Wednesday</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Thursday</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Friday</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Saturday</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Sunday</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow ID="row7">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">7:00 am</asp:TableCell>                        
                    </asp:TableRow>
                    <asp:TableRow ID="row75">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row8" CssClass="row_gray">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">8:00 am</asp:TableCell>                        
                    </asp:TableRow>
                    <asp:TableRow ID="row85" CssClass="row_gray">                                            
                    </asp:TableRow>
                    <asp:TableRow ID="row9">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">9:00 am</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row95">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row10" CssClass="row_gray">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">10:00 am</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row105" CssClass="row_gray">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row11">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">11:00 am</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row115">                                        
                    </asp:TableRow>
                    <asp:TableRow ID="row12" CssClass="row_gray">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">12:00 am</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row125" CssClass="row_gray">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row1">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">1:00 pm</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row15">                       
                    </asp:TableRow>
                    <asp:TableRow ID="row2" CssClass="row_gray">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">2:00 pm</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row25" CssClass="row_gray">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row3">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">3:00 pm</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row35">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row4" CssClass="row_gray">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">4:00 pm</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row45" CssClass="row_gray">                        
                    </asp:TableRow>
                    <asp:TableRow ID="row5">
                        <asp:TableCell CssClass="tt_hours_column" RowSpan="2">5:00 pm</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="row53">                        
                    </asp:TableRow>
                </asp:Table>
                </asp:Panel>                
            </div>    
        </div>
    </ContentTemplate></asp:UpdatePanel>
    </form>
</body>
</html>
