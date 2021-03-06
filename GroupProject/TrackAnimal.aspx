﻿<%@ Page Title="Track Animal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrackAnimal.aspx.cs" Inherits="TrackAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>
        .panel-heading-custom {
            background: #7e57c2;
            color: #fff;
        }
        .modal-header {
            background: #7b1fa2;
            color: #fff;
        }
        .panel > .panel-heading {
            background-color: #ede7f6 ;
        }
    </style>
    
       <div id="page-wrapper">
            <div class="row ">
                <div class="col-lg-12">
                    <h1 class="panel-heading panel-heading-custom">Track Animals <i class="fa fa-map-marker"></i> </h1>
                </div>
                 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Map
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           
                           <div class="row col-lg-12">
	                           <div id="mapid"></div>
	                            
                              
                               <script>
                                   
                                  var geocoder;
                                  var map;
                                  var address = "Bluefield";
                                  var address1 = "Blacksburg";
                                   var address2 = "Roanoke";
                                   var address3 = "Abingdon";
                                  var address4 = "Pulaski"
                                   //"1800 S Delphine Ave, Waynesboro";

                                  function initMap() {
                                    var map = new google.maps.Map(document.getElementById('mapid'), {
                                      zoom: 8,
                                      center: {lat: 38.065229, lng: -78.905888}
                                    });
                                    geocoder = new google.maps.Geocoder();
                                    codeAddress(geocoder, map);
                                  }

                                  function codeAddress(geocoder, map) {
                                    geocoder.geocode({'address': address}, function(results, status) {
                                      if (status === 'OK') {
                                        map.setCenter(results[0].geometry.location);
                                        var marker = new google.maps.Marker({
                                          map: map,
                                          position: results[0].geometry.location
                                        });
                                      } else {
                                        alert('Geocode was not successful for the following reason: ' + status);
                                      }
                                      });
                                      
                                      geocoder.geocode({'address': address2}, function(results, status) {
                                      if (status === 'OK') {
                                        map.setCenter(results[0].geometry.location);
                                        var marker = new google.maps.Marker({
                                          map: map,
                                          position: results[0].geometry.location
                                        });
                                      } else {
                                        alert('Geocode was not successful for the following reason: ' + status);
                                      }
                                      });
                                      geocoder.geocode({'address': address3}, function(results, status) {
                                      if (status === 'OK') {
                                        map.setCenter(results[0].geometry.location);
                                        var marker = new google.maps.Marker({
                                          map: map,
                                          position: results[0].geometry.location
                                        });
                                      } else {
                                        alert('Geocode was not successful for the following reason: ' + status);
                                      }
                                      });
                                      geocoder.geocode({ 'address': address1 }, function (results, status) {
                                      if (status === 'OK') {
                                        map.setCenter(results[0].geometry.location);
                                        var marker = new google.maps.Marker({
                                          map: map,
                                          position: results[0].geometry.location
                                        });
                                      } else {
                                        alert('Geocode was not successful for the following reason: ' + status);
                                      }
                                      });
                                      geocoder.geocode({ 'address': address4 }, function (results, status) {
                                      if (status === 'OK') {
                                        map.setCenter(results[0].geometry.location);
                                        var marker = new google.maps.Marker({
                                          map: map,
                                          position: results[0].geometry.location
                                        });
                                      } else {
                                        alert('Geocode was not successful for the following reason: ' + status);
                                      }
                                      });
                                  }
                                </script>
                               <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD67D7CvKJur6dWrEq-0bq2hCQRnlqugA0&callback=initMap"></script>
    
	                         </div>
	                         <div class="row" id="formHeader">
	                         	<div class="col-lg-5">
	                         		<h4><strong>Find your animal</strong></h4>
	                         	</div>
	                         </div>
	                         <div class="row">
	                         	
	                         		
	                         			<%--<div class="col-lg-3">
	                         				<label class="form-control-label">Bird(s)</label>
	                         				<select class="custom-select form-control" multiple>
	                         					<option>Eugene</option>
	                         					<option>Hector</option>
	                         					<option>Kyle</option>
	                         					<option>Porter</option>
	                         					<option>Ursala</option>
	                         				</select>
	                         			</div>
	                         			<div class="col-lg-3">
	                         				<label class="form-control-label">Mammal(s)</label>
	                         				<select class="custom-select form-control" multiple>
	                         					<option>Lucy</option>
	                         				</select>
	                         			</div>
	                         			<div class="col-lg-3">
	                         				<label class="form-control-label">Reptile(s)</label>
	                         				<select class="custom-select form-control" multiple>
	                         					<option>Ethan</option>
	                         					<option>Mairin</option>
	                         					<option>Stevie</option>
	                         				</select>
	                         			</div>--%>

                                 <div class="panel-body">
                            
                           
                            <asp:GridView ID="gvRegularProgram" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AlternatingRowStyle-BackColor="#EDE7F6">

                                <Columns>
                                    
                                    <asp:BoundField DataField="ProgName" HeaderText="Program" SortExpression="ProgName" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                    <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" SortExpression="ProgramID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />

                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [ProgramID],[ProgName],[City],[County] from dbo.RegularProgram "></asp:SqlDataSource>
                               <%--<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">--%>  
                            
                        </div>
	                         			<%--<div class="col-lg-2 offset-lg-1" id="trackAnimalButton">
	                         				<button class="btn btn-primary submit" type="button">Submit</button>
	                         			</div>--%>
	                         		</div>
	                         	
	                         
	                        </div>






						 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->

   


</asp:Content>

