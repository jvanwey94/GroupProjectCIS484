<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrackAnimal.aspx.cs" Inherits="TrackAnimal" %>

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
	                           <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD67D7CvKJur6dWrEq-0bq2hCQRnlqugA0&sensor=false" type="text/javascript"></script>  
                                <script>  
                                    var mapcode;  
                                    var diag;  
                                    function initialize() {  
                                        mapcode = new google.maps.Geocoder();  
                                        var lnt = new google.maps.LatLng(38.435159, -78.869808);  
                                        var diagChoice = {  
                                            zoom: 9,  
                                            center: lnt,  
                                            diagId: google.maps.MapTypeId.ROADMAP  
                                        }  
                                        diag = new google.maps.Map(document.getElementById('mapid'), diagChoice);  
                                    }  
                                    function getmap() {  
                                        var completeaddress = document.getElementById('txt_location').value;  
                                        mapcode.geocode({ 'address': completeaddress }, function (results, status) {  
                                            if (status == google.maps.GeocoderStatus.OK) {  
                                                diag.setCenter(results[0].geometry.location);  
                                                var hint = new google.maps.Marker({  
                                                    diag: diag,  
                                                    position: results[0].geometry.location  
                                                });  
                                            } else {  
                                                alert('Location Not Tracked. ' + status);  
                                            }  
                                        });  
                                    }  
                                    google.maps.event.addDomListener(window, 'load', initialize);  
                                </script>  
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
	                         				<a href="#"><button class="btn btn-primary submit" type="button">Submit</button></a>
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

