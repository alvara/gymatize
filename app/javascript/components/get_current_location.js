const getCurrentLocation = () => {
  navigator.geolocation.getCurrentPosition((data) => {
    
    const latitude_node = document.querySelector('#latitude');
    const longitude_node = document.querySelector('#longitude');

    // if coordinates exist, insert to hidden field to pass to controller
    if(latitude_node){
      latitude_node.value = data.coords.latitude;
    }

    if(longitude_node){
      longitude_node.value = data.coords.longitude;
    }
  });
}

export { getCurrentLocation }

