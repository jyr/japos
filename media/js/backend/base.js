$(document).ready(function(){
	$().ajaxSuccess(function(evt, request, settings){        
        //TABS
        $('.detail').live('click',function() { 
            $().gui({method: 'add', module: $(this).attr('rel'), action: 'detail', id: $(this).attr('id'), title: 'Details'});
            return false;
	    });
	
        $('.add-tab').live('click',function() { 
            $().gui({method: 'add', module: $(this).attr('rel'), action: 'add', id: $(this).attr('id'), title: 'Add'});
            return false;
	    });
	    
	    $('.edit-tab').live('click',function() { 
            $().gui({method: 'add', module: $(this).attr('rel'), action: 'edit', id: $(this).attr('id'), title: 'Add'});
            return false;
	    });

	    $('.exit').live('click', function(){
	        $().gui({method: 'close', module: $(this).attr('rel')});
            return false;
	    });
	
	    //Paginacion
	    $('.page').live('click',function(){
	        $().gui({method:'pagination', url: $(this).attr('rel')});
	        return false;
	    });
	
	    //Seleciona todos los checkbox
	    $('#check-all').live('click',function(){
            $().gui({method: 'checkall', status: this.checked});
            //return false;
	    });
	
	    //Aplicar accion seleccionada
	    $('.apply').live('click', function(){
	        module = $(this).attr('rel');

	        $("input[name='check[]']").each(function(){
	            if (this.checked){
                    status = this.checked;
	            }
 	        });

            if (!status){
                $().gui({method:'growl', title: 'Success: Atention', text: 'Check a option', image: '/media/img/backend/Symbol-Exclamation.png', sticky:false});
            }
        
            status = true;
	        //$("input[name=check[]]:checked").each(function(i){
	        action= $('select.dropdown option:selected').val();
            
	            if (action == 'remove')
	            {
                    $().gui({method: 'block'});
                    $('#yes').one('click',function(){
                        $("input[name=check[]]:checked").each(function(i){
                            id = this.value;
	                        $().gui({method: 'remove', id: id, module: module, action: action});
                        });
                        $.unblockUI();
                    });
                
                    $('#no').one('click', function(){
                        $.unblockUI();
                        return false;
                    });
	                status = true;
	            }
	            else
	            {
	                if(status)
	                {
    	                $().gui({method:'growl', title: 'Success: Atention', text: 'Select a action', image: '/media/img/backend/Symbol-Exclamation.png', sticky:false});
    	                status = false;
	                }
	            }
            return false;
	        // });
	    });
	
	    //Borrar registro
	    $('.delete').live('click',function(){
	        module = $(this).attr('rel');
	        id = $(this).attr('id');
	        action = $(this).attr('class');
	    
            $().gui({method: 'block'});
            $('#yes').bind('click',function(){
	            $().gui({method: 'remove', id: id, module: module, action: action});
                $.unblockUI();
            });
        
            $('#no').live('click', function(){
                $.unblockUI();
                return false;
            });
	    });
	    
	    $('#search').live('submit',function(){
	        title = $(this).attr('title');
            $(this).ajaxSubmit({
                target: '.tab-content',
                url: $(this).attr('action'),
                type: 'POST',
                success: $().gui({method:'growl', title: 'Success: '+title, text: 'Wait...', image: '/media/img/backend/Symbol-Refresh.png', sticky:false})
            });
            return false; 
	    });
	
	    $('#submit').live('submit', function(){
	        title = $(this).attr('title');
	        $(this).ajaxSubmit({
                type: 'POST',
                success: $().gui({method:'growl', title: 'Success: '+title, text: 'Money updated', image: '/media/img/backend/Symbol-Refresh.png', sticky:false})
	        });

	        $(document).trigger('close.facebox');

	        if($('.current-tab').attr('href') != $(this).attr('action')){
	            if($('.current-tab').attr('href')){
                    $('.content-box-content').load($('.current-tab').attr('href'));
                }else{
                    $('.content-box-content').load($('.default-tab').attr('href'));
                }
	        }else{
                $().gui({method: 'close', module: $(this).attr('rel')});
                $('.content-box-content').load($('.default-tab').attr('href'));
            }

	        return false;
	    });
	    
	    $('.add').one('click',function(){
	        module = $(this).attr('rel');
	        action = $(this).attr('title');
	        $('.facebox').one(jQuery.facebox({'ajax':'/backend/'+module+'/add/'}));
            return false;
	    });
    });
});