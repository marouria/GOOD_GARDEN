// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


  $("input:checkbox").click(function() {
  var bol = $("input:checkbox:checked").length >= $('.temp_information').data('temp');

  $("input:checkbox").not(":checked").attr("disabled",bol);
  });
