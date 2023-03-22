function showPopup() {
    alert("This book has been added!");
  }
  
  $(document).ready(function(){
    $(".form-addcart").on("submit", function(e){
      e.preventDefault();
      $.ajax({
        method: "POST",
        url: this.action,
        data: $(this).serialize()
      }).done(function(response){
        showPopup();
      });
    });
  });
//  xu ly thong bao add to cart thanh cong  