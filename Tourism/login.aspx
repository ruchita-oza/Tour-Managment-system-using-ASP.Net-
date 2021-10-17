<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tourism.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container shadow p-3 mb-5 bg-body rounded">
      <div class="row">
         <div class="col-md-6 mx-auto">            
                  <div class="row">
                     <div class="col">
                        <center>
                           <img class="zoomImg" width="150px" src="imgs/login.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Member Login</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email ID"></asp:TextBox>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div >
                         <br />
                         <center>
                             <div class="form-group">                             
                                <asp:Button class="btn btn-secondary btn-block btn-lg" ID="Button1" runat="server" type="button" Text="Login" OnClick="Button1_Click" />
                               <a href="usersignup.aspx"><input class="btn btn-dark btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>                          
                            </div>
                        </center>
                     </div>
                  </div>
               </div>
            </div>
         <br />
            <a href="homepage.aspx"><- Back to Home</a><br><br><br /><br />
         </div>
</asp:Content>
