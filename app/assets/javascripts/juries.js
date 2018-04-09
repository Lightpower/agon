A.jury = {
  currentPage: function() { return $('div.content').data('page') },
  maxPage: function() { return $('div.content').data('max-page') },
  presentationId: function() { return $('div.content').data('presentation-id') },

  setPage: function(pageNum) {
    $('div.content').data('page', pageNum);
    $('div.content img').addClass('hidden');
    $('span#page_number').text(pageNum);
    $($('div.content img')[pageNum - 1]).removeClass('hidden');
  },

  prev: function() {
    var new_page = this.currentPage() - 1;
    if(new_page <= 1) new_page = 1;
    this.setPage(new_page);
  },	

  next: function() {
    var new_page = this.currentPage() + 1;
    if(new_page >= this.maxPage()) new_page = this.maxPage();
    this.setPage(new_page);
  },

  getCurrentPage: function() {
    var url = '/presentations/' + this.presentationId() + '/current_page';

    $.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
    }).done(function(message){
      A.jury.setPage(message['page']);
    });
  },

  setCurrentPage: function(new_page) {
    var url = '/presentations/' + this.presentationId() + '/current_page?page=' + new_page;

    $.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
    });
  }

};

$(function() {
  $("a.btn.back").on("click", function(e) {
    A.jury.prev();
    event.preventDefault();
  });
  $("a.btn.next").on("click", function(e) {
    A.jury.next();
    event.preventDefault();
  });
  $("a.btn.sync").on("click", function(e) {
    A.jury.getCurrentPage();
    event.preventDefault();
  });
});
