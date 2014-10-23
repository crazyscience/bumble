# Handle delete buttons on posts index page
$('.js-delete-post').on 'click', (e) ->
  # Make sure the user wants to delete the post.
  r = confirm("Are you sure you want to delete the post?")

  if (r == false)
    e.preventDefault()

###
  When a user clicks a Tab Header, change the content
###
$('._tab-header').on 'click', (e) ->
  e.preventDefault()

  tab = $(this)

  content = tab.data('tabTarget')

  console.log content

  $('.tab').hide()
  $("#" + content).show()

  $('.tab-header').removeClass('tab-header__active')
  $(this).addClass('tab-header__active')

###
  Select the first tab in the list
###
$('.tab-header').first().addClass('tab-header__active')
$('.tab').hide().first().show()


###
  Set up WYSIWYG fields
###
btnsGrps = jQuery.trumbowyg.btnsGrps

$('._wysiwyg').trumbowyg({
  autogrow: true,
  btns: ['viewHTML',
         btnsGrps.design,
         'link',
         'insertImage',
         btnsGrps.justify,
         btnsGrps.lists,
         'insertHorizontalRule']
#  fullscreenable: false,
#  closable: true,
#  btns: ['bold', 'italic', '|', 'insertImage']
});


###
  Handle Dropdown Menus
###
$('._dropdown').on 'click', (e) ->
  e.preventDefault()
  $dropdown = $(this)

  $target = $('#' + $dropdown.data('dropdownTarget'))

  $target.toggleClass('is-visible')

  e.stopPropagation()

###
  Handle Clicks Outside of the Dropdown Menu
###
$(document).on 'click', (e) ->
    $('._dropdown-menu').removeClass("is-visible")
