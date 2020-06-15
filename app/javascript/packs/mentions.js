console.log("MENTIONS");
import Tribute from "tributejs";
var tribute = new Tribute({
  values: [
    {key: 'Phil Heartman', value: 'pheartman'},
    {key: 'Gordon Ramsey', value: 'gramsey'}
  ],
  trigger: '@',
  selectTemplate: function (item) {
    return '@' + item.original.value;
  },
  menuItemTemplate: function (item) {
    return item.string;
  },
  lookup: 'key',
  autocompleteMode: true,
  menuShowMinLength: 1,
  menuContainer: document.body,
})

console.log(tribute);

tribute.attach(document.querySelectorAll('#comment-box'));

if (tribute.isActive) {
  console.log("Somebody is being mentioned!");
} else {
  console.log("Who's this guy talking to?");
}
// let activateLink = document.querySelector('.comment_body')
// activateLink.addEventListener("mousedown", function(e) {
//   e.preventDefault();
//   var input = document.getElementById("test");

//   tribute.showMenuForCollection(input);
// });