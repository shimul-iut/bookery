
# genres = Genre.create([
#     {
#         name: "Fantasy",
#         popularity_rating: "3.5"
#     },
#     {
#         name: "Fiction",
#         popularity_rating: "4.1"
#     },
#     {
#         name: "History",
#         popularity_rating: "3.9"
#     }
# ])
# users = User.create([
#     {
#         name: "Shimul",
#         company_email: "anik.shimul@enosisbd.com",
#         company_id: "603",
#         company_role: "Project Lead",
#         phone: "01819458461"
#     },
#     {
#         name: "Sakib",
#         company_email: "sakib@enosisbd.com",
#         company_id: "5",
#         company_role: "Project Manager",
#         phone: "01819284036"
#     }
# ])
# book_lists = BookList.create([
#     {
#         name: "The Lord Of The Rings",
#         author: "John Ronald Reuel Tolkien",
#         unique_id: "2AV461331HW",
#         image_url: "https://books.google.com.bd/books/content?id=GuLZAAAAMAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE72Hs9lJnz_gkPHS3UBHWwHdD4d9rHEencnGZiLDP8FcoiHg9NX7jummFIm3-LH-X2gbrBWqe0tax6A5rlbs7KCL7-9NP6qOjdP7OVsgSb-W3H1qPe_lA_9QrU5XoQ8NzJkO-spe",
#         isbn: "0618517650",
#         genre_id: 1,
#         book_owner_id: 2
#     },
#     {
#         name: "Nineteen Eighty-Four (1984)",
#         author: "George Orwell",
#         unique_id: "AFV001331JW",
#         image_url: "https://books.google.com.bd/books/publisher/content?id=YyPvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70xnyOh2lPcolXkRITVURNScstQfA9J8SbgjUxJ-sKY8ucNSlfF84QVhy__mk8X0DNQehjTYPxKpYUy8Qdios1UJT5OcQVkInGW8sj8vsyaMQcK3ikGg12DnhmJnzEDyo6qDKlf",
#         isbn: "0618907650",
#         genre_id: 2,
#         book_owner_id: 1
#     }       
# ])
book_owners = BookOwner.create([
    {
        user_id: 2,
        book_list_id: 1
    },
    {
        user_id: 1,
        book_list_id: 2
    }
])