import $ from 'jquery';

const change_visibility = (status) => {
  if (status == "Scheduled") {
    $('.published_at').show();
  } else {
    $('.published_at').hide();
  }
}

$(() => {
  change_visibility($('#actor_status :selected').text())
  $('#actor_status').on('change', (e) => {
    change_visibility($('#actor_status').find(':selected').text())
  })
})


