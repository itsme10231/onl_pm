ClassicEditor 

    .create( document.querySelector( '#content' ),{
    	removePlugins: ['Image', 'ImageUpload', 'ImageToolbar', 'ImageCaption', 'ImageStyle'],
    	image: {}
    	
    } ) 

    .then( editor => { 
    	
//        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );

