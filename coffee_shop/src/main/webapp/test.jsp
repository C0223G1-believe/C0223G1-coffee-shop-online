<!DOCTYPE html>
<html>
<head>
  <title>Toast Message Demo</title>
  <style>
    /* Styling for the toast message */
    .toast {
      background-color: #333;
      color: #fff;
      padding: 15px;
      border-radius: 5px;
      position: fixed;
      bottom: 30px;
      right: 30px;
      z-index: 1;
      display: none;
    }
  </style>
</head>
<body>
<button onclick="showToast()">Show Toast Message</button>

<div id="toastMessage" class="toast"></div>

<script>
  function showToast() {
    var toast = document.getElementById("toastMessage");
    toast.style.display = "block";
    toast.innerText = "Hello, World!";

    setTimeout(function() {
      toast.style.display = "none";
    }, 3000); // Hide the toast message after 3 seconds
  }
</script>
</body>
</html>