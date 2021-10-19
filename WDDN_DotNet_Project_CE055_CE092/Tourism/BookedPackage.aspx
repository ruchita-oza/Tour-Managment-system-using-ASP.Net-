<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookedPackage.aspx.cs" Inherits="Tourism.BookedPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
    protected void TextBox5_TextChanged(object sender, EventArgs e)
         {

            if (TextBox4.Text.Length != 0 && TextBox5.Text.Length != 0)
             {
                     
                     //Response.Write("<script>console.log('" + pr + "');

                 int total_days = Convert.ToInt32(TextBox4.Text.Trim());
                 int total_member = Convert.ToInt32(TextBox5.Text.Trim());
                 int total = total_days * total_member * Convert.ToInt32(Price.Text);
                 TextBox7.Text = "" + total;
                 TextBox7.Enabled = false;
             }
         }
    </script>
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
                                <asp:TextBox CssClass="form-control" ID="TextBox4"  runat="server"  AutoPostBack="true" placeholder="Enter Total No of Days" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"  OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                            </div>

		                    <div class="form-group">
                                <label for="name">Total Members</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Total Members(including Adults & Childern above 5yrs)" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"  AutoPostBack="true" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="name">Final Amount</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Amount"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="desc">Any Special Request</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Special Request" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                            <div class="row">
                                <div class="col">                                   
                                    <div class="col-md-8 ">                                               
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <asp:Image ID="Image1" class="img-fliud p-2" runat="server" />                          
                                                    </div>                        
                                                </div>
                                                <div class="col-md-8 ">
                                                   <div class="row">
                                                       <div class="col-md-12">
                                                            <asp:Label ID="Package_name" runat="server"  Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                       </div>
                                                   </div>         
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <asp:Label ID="Package_category" runat="server" Font-Bold="True" ></asp:Label>
                                                            <p  class="font-weight-bold p-1"><asp:Label runat="server" ID="Price"></asp:Label> RS./<span class="text-muted"> person</span></p>
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

