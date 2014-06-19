randomID = ''
yesList = [
]
MovieID = ''

$ ->
  r = Math.floor(Math.random() * 100000)
  randomID = '' + r
  iterate()
  loadMovie(MovieID)

# yes

$('.yes').click (event) ->
  yesList[yesList.length] = MovieID
  iterate()
  loadMovie(MovieID)

# no

$('.no').click (event) ->
  iterate()
  loadMovie(MovieID)

# Quit program

$('.quit').click (event) ->
  listMovie(yesList)

# Iterate to the next movie

iterate = () ->
  i = parseInt(randomID)
  i = i + 1
  randomID = '' + i
  if randomID.length < 7
    while randomID.length < 7
      randomID = '0' + randomID
  MovieID = 'tt' + randomID

# List all liked movies

listMovie = (array) ->
  $('body').html("<h1>List of movies to watch</h1>")

  for i in [0..(array.length-1)]
    resp = $.ajax(
      "http://www.omdbapi.com/?i=#{array[i]}"
      type: 'GET' #not a mandatory field
      dataType: "json"
    )

    resp.done (movie) ->
      $('body').append("<p>#{movie.Title}</p>")


# Load the movie

loadMovie = (movieID) ->

  resp = $.ajax(
    "http://www.omdbapi.com/?i=#{movieID}"
    type: 'GET' #not a mandatory field
    dataType: "json"
  )

  resp.done (movie) ->

    if movie.Poster is 'N/A'
      $('.poster').html("<img src=noimage.jpg>")
    else
      $('.poster').html("<img src='#{movie.Poster}'>")
    $('.actors').html("#{movie.Actors}")
    $('.name > h1').html("#{movie.Title}")
    $('.plot').html("#{movie.Plot}")



swipe = () ->












