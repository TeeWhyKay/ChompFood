const initModal = () => {
  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var foodName = button.data('food-name') // Extract info from data-* attributes
    var foodPrice = button.data('food-price')
    var foodId = button.data('food-id')
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)
    modal.find('.modal-title').text(foodName)
    modal.find('.modal-price').text('S$' + foodPrice)
    modal.attr('data-current-food-id', foodId)
  })
};

export { initModal };
