<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="post">
			 	<div class="modal-body">
			    	Przyjęcie do naprawy:
			    	<div class="form-group form-row">
			    		<div class="col">
			    			<input class="form-control" type="date" name="takeInDay">
			    		</div><div class="col">
			    			<input class="form-control" type="time" name="takeInTime">
			    		</div>
			    	</div>
			    	Planowane rozpoczęcie naprawy:
			    	<div class="form-group form-row">
			    		<div class="col">
			    			<input class="form-control" type="date" name="plannedRepairBeginDay">
			    		</div><div class="col">
			    			<input class="form-control" type="time" name="plannedRepairBeginTime">
			    		</div>
			    	</div>
			    	<div class="form-group">
			    		<input class="form-control" type="number" name="employeeId" placeholder="Id pracownika">
			    	</div>
			    	<div class="form-group">
			    		<textarea class="form-control" name="problemDescription" placeholder="Opis problemu"></textarea>
			    	</div>
			 	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
					<button type="submit" class="btn btn-primary">Zapisz</button>
				</div>
			</form>
	    </div>
	</div>
</div>