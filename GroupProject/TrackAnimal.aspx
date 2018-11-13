<%@ Page Title="Track Animal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrackAnimal.aspx.cs" Inherits="TrackAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    
       <div id="page-wrapper">
            <div class="row ">
                <div class="col-lg-12">
                    <h1 class="page-header">Track Animals <i class="fa fa-paw icon"></i> </h1>
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
                                  var address = "1800 S Delphine Ave, Waynesboro";
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
                                  }
                                </script>
                               <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD67D7CvKJur6dWrEq-0bq2hCQRnlqugA0&callback=initMap"></script>
    
	                         </div>
	                         <div class="row" id="formHeader">
	                         	<div class="col-lg-5">
	                         		<h4><strong>Which animals do you have with you?</strong></h4>
	                         	</div>
	                         </div>
	                         <div class="row">
	                         	
	                         		
	                         			<div class="col-lg-3">
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
	                         			</div>
	                         			<div class="col-lg-2 offset-lg-1" id="trackAnimalButton">
	                         				<button class="btn btn-primary submit" type="button">Submit</button>
	                         			</div>
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

