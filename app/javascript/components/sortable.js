import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#plant-list');
  const selection = document.querySelector('#selection');

  new Sortable(list, {
    group: 'shared', // set both lists to same group
    animation: 150,
    draggable: ".tag-content",
});
console.log(selection.dataset.slots);
  new Sortable(selection, {
      group: {
        name: 'shared',
        put: function (to) {
          return to.el.children.length < selection.dataset.slots;
        }
      },
      animation: 150
    });
 console.log(selection.dataset.slots);
};

// onEnd: function (/**Event*/evt) {
//     var itemEl = evt.item;  // dragged HTMLElement
//     evt.to;    // target list
//     evt.from;  // previous list
//     evt.oldIndex;  // element's old index within old parent
//     evt.newIndex;  // element's new index within new parent
//     evt.oldDraggableIndex; // element's old index within old parent, only counting draggable elements
//     evt.newDraggableIndex; // element's new index within new parent, only counting draggable elements
//     evt.clone // the clone element
//     evt.pullMode;  // when item is in another sortable: `"clone"` if cloning, `true` if moving
//   },

export { initSortable };


// ghostClass: "ghost",
//   animation: 150,
//   onEnd: (event) => {
//     alert(`${event.oldIndex} moved to ${event.newIndex}`);
