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
           /* img {
                  border-radius: 100%;
            }*/
             content .contentBx h4{
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 500;
    font-size: 18px;
    text-align: center;
    margin: 20px 0 10px;
    line-height: 1.1em;
    text-align:center
    }

contentBx h4 span{
    font-size: 12px;
    font-weight: 300;
    text-transform: initial;
}
.content img{
    border-radius: 50%;
    overflow: hidden;
    border: 5px solid rgba(0,0,0,0.78);
}

.content img {
    top: 0;
    left: 0;
    object-fit: cover;
    transition:0.5s ease-in-out;
}
.content img:hover{
    opacity: 1;
    transform: translateY(-20px);
    transform: scale(1.1);
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
              <div class="container card">                 
                         <div class="row">
                              <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">				
				                <ItemTemplate>		
                                    <div class="col-md-4">
                                       <center class="content">
                                          <a href="packages.aspx?category=<%#Eval("category_name") %>">
                                               <asp:image id="img" runat="server" imageurl="imgs/adventure.png" />
                                          </a>
                                           <div class="contentBx">
                                          <h4><%#Eval("category_name") %></h4>  </div>                                            
                                       </center>
                                    </div> 
                                </ItemTemplate>
				            </asp:Repeater>
                        </div>                        
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString %>" SelectCommand="SELECT * FROM [category_management_tbl]"></asp:SqlDataSource>
              </div>            
           </section>
</asp:Content>
