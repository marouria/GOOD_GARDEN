import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#plant-list');
  const selection = document.querySelector('#selection');

  new Sortable(list, {
    group: 'shared', // set both lists to same group
    animation: 150,
    draggable: ".tag-content",
});
  new Sortable(selection, {
      group: {
        name: 'shared',
        put: function (to) {
          return to.el.children.length < selection.dataset.slots;
        }
      },
      onEnd: (event) => {
    alert(`${event.oldIndex} moved to ${event.newIndex}`);
  }
      animation: 150
    });
};


export { initSortable };


// ghostClass: "ghost",
//   animation: 150,
//   onEnd: (event) => {
//     alert(`${event.oldIndex} moved to ${event.newIndex}`);
