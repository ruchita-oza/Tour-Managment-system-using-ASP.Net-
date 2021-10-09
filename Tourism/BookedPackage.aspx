<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookedPackage.aspx.cs" Inherits="Tourism.BookedPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <div class="container">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                    <div class="col-4">
                        <h3>Your Contact Details</h3>    
                            <div class="form-group">
                                <label for="name">Name</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Enter Your Name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="name">Email</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Enter Your Email"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="name">Phone</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Enter Your Phone Number"></asp:TextBox>
                            </div>

		                    <div class="form-group">
                                <label for="name">Total No of Days</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Enter Total No of Days"></asp:TextBox>
                            </div>

		                    <div class="form-group">
                                <label for="name">Total Members</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Total Members(including Adults & Childern above 5yrs)"></asp:TextBox>
                            </div>


                            <div class="form-group">
                                <label for="desc">Any Special Request</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Package Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                            <br />
                            <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Submit" OnClick="Button1_Click" />                            
                        <br />
                    </div>
               </div>
                </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
            </div>
             </div>
         <div class="col-md-5">
            <div class="card-column">
               <div class="card-body">
                   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>  
                            <div class="row">
                                <div class="col">                                   
                                    <div class="col-md-8 ">                                               
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <asp:Image ID="Image1" class="img-fliud p-2" runat="server" ImageUrl='<%# Eval("images") %>' />                          
                                                    </div>                        
                                                </div>
                                                <div class="col-md-8 ">
                                                   <div class="row">
                                                       <div class="col-md-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("package_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                       </div>
                                                   </div>         
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("package_category") %>'></asp:Label>
                                                            <p class="font-weight-bold p-1">Price: RS. <%#Eval("price") %> /<span class="text-muted"> person</span></p>
                                                            <div class="col-sm-2">
                                                                <span class="Days p-1 text-white d-flex text-center">1D-1N</span>                       
                                                            </div>
                                                        </div>                        
                                                    </div>
                                                </div>
                                            </div>                        
                                        </div>  
                                    </div>                                   
                                </div>
                            </div>
                        </div>  
                    </ItemTemplate>
                </asp:Repeater>
	                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString2 %>" SelectCommand="SELECT [package_id], [package_name], [package_category], [price], [images] FROM [package_management_tbl] WHERE ([package_id] = @package_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="package_id" QueryStringField="package_id" Type="Int32" />
                        </SelectParameters>
                   </asp:SqlDataSource>
	            </div>
               </div>
            </div>
         </div>
   </div>
</asp:Content>

