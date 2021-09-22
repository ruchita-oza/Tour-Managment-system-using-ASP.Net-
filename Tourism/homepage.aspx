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
              <div class="container">
                 <div class="row">
                    <div class="col-12">
                       <center>
                          <h2>Explore Categories</h2>
                          <p><b>Explore Different Categories:-</b></p>
                       </center>
                    </div>
                 </div>
                 <div class="row">
                    <div class="col-md-4">
                       <center>
                          <img width="200px" src="imgs/adventure.png"/>
                          <h4>Adventure</h4>
                          <p class="text-justify">One way to get the most out of life is to look upon it as an adventure. Adventure isn't hanging off a rope on the side of a mountain. Adventure is an attitude we must apply to the day to day obstacles of life.</p>
                       </center>
                    </div>
                    <div class="col-md-4">
                       <center>
                          <img width="200px" src="imgs/beaches.png"/>
                          <h4>Beaches</h4>
                          <p class="text-justify">Time doesn’t move hour to hour but mood to moment. Beach life is different when you live by the currents plan and not your own allowing you to let go of things you can’t control. It’s one of the simple treasures life holds when we find joy in nature and live in bliss </p>
                       </center>
                    </div>
                    <div class="col-md-4">
                       <center>
                          <img width="200px" src="imgs/tourist_attraction.png"/>
                          <h4>Tourist Attraction</h4>
                          <p class="text-justify">The world is a book and those who do not travel read only one page. When you travel, the whole world opens up. Travel has helped us to understand the meaning of life and it has helped us become better people. Each time we travel, we see the world with new eyes.</p>
                       </center>
                    </div>
                 </div>
              </div>
           </section>

   <section>
      <div class="container">
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="200px" src="imgs/hillstation.png" />
                  <h4>Hill Station</h4>
                  <p class="text-justify">Mountains are the Beginning and End of All Natural Scenery. Explore the best hill stations owing to its pristine beauty and pleasant weather. An ideal holiday spot for nature lovers and a delight for adventure seekers. </p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="200px" src="imgs/trekking.png"/>
                  <h4>Trekking</h4>
                  <p class="text-justify">Some mountains only require a good pair of shoes. Others require an entire team to conquer. Knowing which is which, is the key to success. Grab the opportunity.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="200px" src="imgs/weekend_gateways.png"/>
                  <h4>Weekend Gateways</h4>
                  <p class="text-justify">Weekends were the ultimate opportunity to ditch the sticky subways and heat for a bit, and simply relax. You can chill out with your friends and family or can go for a long drive.</p>
               </center>
            </div>
         </div>
      </div>
   </section>
</asp:Content>
