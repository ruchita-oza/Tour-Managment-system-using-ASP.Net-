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
                            <div class="col-md-4">
                               <center>
                                  <a href="packages.aspx">
                                       <asp:image id="img" runat="server" imageurl="imgs/adventure.png" />
                                  </a>
                                  <h4>International Packages</h4>   
                                   <p class="text-justify">International travel the frenzy of going on a world tour is not lost on most avid Indian travellers. It is time to scour world tour packages who have with them a host of international tour package, depending on your choice of destination and the season in which you plan to travel.</p>
                               </center>
                            </div>
                            <div class="col-md-4">
                               <center>
                                  <a href="packages.aspx">
                                       <asp:image id="Image1" runat="server" imageurl="imgs/adventure.png" />
                                  </a>
                                  <h4>National Packages</h4>
                                  <p class="text-justify">You can now choose from an array of holiday packages in India that span across the length and breadth of the country, taking you into breathtaking tea estates, hill resorts to splendid backwater retreats. By booking your India tour, you get to customise your holiday to suit your requirement.</p>
                               </center>
                            </div>
                            <div class="col-md-4">
                               <center>
                                   <a href="packages.aspx">
                                       <asp:image id="Image2" runat="server" imageurl="imgs/adventure.png" />
                                  </a>
                                  <h4>Family Packages</h4>
                                  <p class="text-justify">The list of top family holiday packages in India. Be it any part of the country or any season of the year our packages give you the best options of embarking on an enjoyable family vacation to these destinations. You are welcome to explore the details of these holiday packages here.</p>
                               </center>
                            </div>
                         </div>
              </div>            
           </section>
</asp:Content>
