String dateString(DateTime date)
{
  return '${date.day} ${month[date.month]!} , ${date.year}' ;
}

String dateTimeString(DateTime date)
{
  String ampm=date.hour<12?'am':'pm';
  return capitalize('${month[date.month]!} ${date.day} ,${date.year} (${date.hour%12}:${date.minute} $ampm)') ;
}

String capitalize(String string)
{
  return string[0].toUpperCase()+string.substring(1);
}

Map<int, String> month = {
  1: 'jan',
  2: 'feb',
  3: 'march',
  4: 'april',
  5: 'may',
  6: "june",
  7: 'july',
  8: 'aug',
  9: 'sept',
  10: 'oct',
  11: 'nov',
  12: 'dec'
};