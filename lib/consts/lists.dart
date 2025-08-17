dynamic breakfastRecipe = [
  {
    "Name": "boil eggs",
    "image":
        "https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.jpg?s=612x612&w=0&k=20&c=wwes11nnPnZu7IFz6SSSjhsfoBK-ZcTFsqH9Em72ClA=",
  },
  {
    "Name": "butter",
    "image":
        "https://t3.ftcdn.net/jpg/02/10/30/54/360_F_210305493_vSBsVrBRyJvLBR5JLKmISAEy3xjfcERN.jpg",
  },
  {
    "Name": "chola",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBjaEIR7eLkOlYHfpcgUC9E2C3KxzL3TV6gg&s",
  },
  {
    "Name": "eggs",
    "image":
        "https://www.onceuponachef.com/images/2024/04/Fried-Egg-Hero-3-1200x900.jpg",
  },
];
dynamic lunchRecioe = [
  {"Name": "beryani", "image": ""},
  {"Name": "lobia", "image": ""},
  {"Name": "vegtebales", "image": ""},
  {"Name": "channa", "image": ""},
];
dynamic dinnerRecipe = [
  {"Name": "vegetables", "image": ""},
  {"Name": "eggs", "image": ""},
  {"Name": "eggs", "image": ""},
  {"Name": "eggs", "image": ""},
];

dynamic favouriteRecipe = [
  {
    "Name": "vegetables",

    "image":
        "https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.jpg?s=612x612&w=0&k=20&c=wwes11nnPnZu7IFz6SSSjhsfoBK-ZcTFsqH9Em72ClA=",
  },
  {
    "Name": "beryani",
    "image":
        "https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.jpg?s=612x612&w=0&k=20&c=wwes11nnPnZu7IFz6SSSjhsfoBK-ZcTFsqH9Em72ClA=",
  },
  {
    "Name": "eggs",
    "image":
        "https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.jpg?s=612x612&w=0&k=20&c=wwes11nnPnZu7IFz6SSSjhsfoBK-ZcTFsqH9Em72ClA=",
  },
  {
    "Name": "eggs",
    "image":
        "https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.jpg?s=612x612&w=0&k=20&c=wwes11nnPnZu7IFz6SSSjhsfoBK-ZcTFsqH9Em72ClA=",
  },
];

List<String> mealtimes = ["breakfast", "lunch", "dinner"];
Map<String, dynamic> menu = {
  "Mon": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "14:00", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
  "Tue": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "18:23", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
  "Wed": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "14:00", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
  "Thu": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "14:00", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
  "Fri": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "14:00", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
  "Sat": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "14:00", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
  "Sun": [
    {"time": "09:00", "meal": "Breakfast"},
    {"time": "14:00", "meal": "Lunch"},
    {"time": "09:00", "meal": "Dinner"},
  ],
};

String hostid = "28";

dynamic _getDayMeals(var days, String day) {
  switch (day.toLowerCase()) {
    case 'monday': return days.monday;
    case 'tuesday': return days.tuesday;
    case 'wednesday': return days.wednesday;
    case 'thursday': return days.thursday;
    case 'friday': return days.friday;
    case 'saturday': return days.saturday;
    case 'sunday': return days.sunday;
    default: return null;
  }
}

