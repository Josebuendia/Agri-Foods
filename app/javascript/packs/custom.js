function myFunction() {
    // Get the checkbox
    var checkBox = document.getElementsByClassName("myTickBox");
    // Get the output text
    var onTickContents = document.getElementsByClassName("onTickContents");
  
    // If the checkbox is checked, display the output text
    if (checkBox.checked == true){
      onTickContents.style.display = "block";
    } else {
      onTickContents.style.display = "none";
    }
  }