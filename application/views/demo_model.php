<form name = 'edit_row' action = 'edit_order_receival' method = 'post'>
         <div class='input-field'>
         <span class='blue-text text-darken-2'>Item Name</span>
         <input type='hidden' value='' id= '' name='modalId'/> 
         <input type='hidden' value='' id= '' name='modalItemName'/>  
         <input type='text' value='' id= 'Disabled' name='itemNameDisabled' readonly/>
         <input type='hidden' value='' id= '' name='modalOldQuantity'/> 
         <input type='hidden' value='' id= '' name='modalOldRate'/> 

         </div>
         </div>
         <div class = 'row'>
         <div class='input-field'>
         <span class='blue-text text-darken-2'>Quantity</span>
         <input type='text' value='' id='' name='modalQuantity'/>
         </div>
         </div>
         <div class = 'row'>
         <div class='input-field'>
         <span class='blue-text text-darken-2'>Rate</span>
         <input type='text' value=''  id='' name='modalRate'/>
         
         </div>
         </div>
         <div class='row'>
         <div class='col s8 offset-s3'>
         <button class='btn waves-effect waves-light btn-large' value='submit' type='submit' name='submit'>
         Submit
         <i class='glyphicon glyphicon-chevron-right'></i>  
         </button>

         <button class='btn waves-effect waves-light red darken-1 btn-large' value='reset' type='reset' name='cancel'>
         Cancel
         <i class='glyphicon glyphicon-remove'></i>
         </button>
         </div>
         </div>
         </form>