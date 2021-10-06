<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="Tourism.packages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">	
	<section class="Ready">
		<div class="container">	
			<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="package_category" DataValueField="package_category" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>            
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:tourismDBConnectionString2 %>' SelectCommand="SELECT DISTINCT [package_category] FROM [package_management_tbl]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">				
				<ItemTemplate>						
					<div class="international owl-carousel">				
						<div class="card px-1" data-toggle="tooltip" title="Russia With Almaty">							
								<asp:Image ID="Image1" class="img-fliud p-2" runat="server" ImageUrl='<%# Eval("images") %>' />                          
							<div class="card-body" style="margin: -15px;">						
								<h5 class="card-text font-weight-bold"><%#Eval("package_name") %></h5>
								<span class="Days p-1 text-white d-flex text-center" style="margin-left: 290px; margin-top: -30px; padding-bottom: -10px; ">1D-1N</span>
								<div class="icons pb-4 d-flex ">
									<img src="imgs/icons/meals.png" class="mx-1">
									<img src="imgs/icons/sightseeing.png" class="mx-1">
									<img src="imgs/icons/hotel.png" class="mx-1">
									<img src="imgs/icons/visa.png" class="mx-1">w
								</div>
								<div class="d-flex">
									<h6 class="font-weight-bold p-1"><%#Eval("price") %> /<span class="text-muted"> person</span></h6>							
								</div>
								<div class="row">
									<div class="col-6">
										<a href="Packages/packageBooked.aspx" class="btn btn-outline-info">Book Package</a>
									</div>
									<div class="col-6">
										<a href='packageView.aspx?package_id=<%# Eval("package_id") %>' class="btn btn-outline-info">View Package</a>
									</div>
								</div>						
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tourismDBConnectionString2 %>" SelectCommand="SELECT * FROM [package_management_tbl]">
            </asp:SqlDataSource>
			</div>		
	</section>			
</asp:Content>
