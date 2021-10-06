<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Tourism.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <style>
            html,body{
                height: 100% !important;
                margin: 0!important;
                overflow-x:hidden !important;
              } 
            body{
              overflow-y: scroll; overflow-x:hidden;
            }
            .dark-bg {
                background-image: linear-gradient(rgba(0,0,0, .5), rgba(0,0,0, .5)), url('imgs/banner.jpg');
                background-size: cover;
                background-position: center center;
                background-attachment: fixed;
            }
            #hero .container {
                height: 100vh;
            }
            img {
                  border-radius: 100%;
            }
        </style>
        <section class="dark-bg" id="hero">
            <div class="container">
              <div class="d-flex h-100 flex-column text-light justify-content-center">
                <h1 class="display-1">Thirst <span class="text-danger">for </span>Travel</h1>
                <p class="lead">Link to travel related   <span
                    class="text-danger">products and services</span> offered by the company.</p>
              </div>
            </div>
        </section>
    <section>
        <div class="row">
            <div class="col-12">
                <center>
                    <h2>Explore Categories</h2>
                    <p><b>Explore Different Categories:-</b></p>
                </center>
            </div>
        </div>
    </section>

        <section>
              <div class="container">                 
                         <div class="row">
                              <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">				
				                <ItemTemplate>		
                                    <div class="col-md-4">
                                       <center>
                                          <a href="packages.aspx?category=<%#Eval("category_name") %>">
                                               <asp:image id="img" runat="server" imageurl="imgs/adventure.png" />
                                          </a>
                                          <h4><%#Eval("category_name") %></h4>                                              
                                       </center>
                                    </div> 
                                </ItemTemplate>
				            </asp:Repeater>
                        </div>                        
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString %>" SelectCommand="SELECT * FROM [category_management_tbl]"></asp:SqlDataSource>
              </div>            
           </section>
</asp:Content>
