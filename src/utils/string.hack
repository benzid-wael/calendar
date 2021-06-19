
namespace Calendar\Utils;


function slugify(string $text, string $divider = '-'): string {
  // replace non letter or digits by divider
  $text = \HH\Lib\Regex\replace($text, '~[^\pL\d]+~u', $divider);

  // remove unwanted characters
  // $text = \HH\Lib\Str\trim($text, '~[^-\w]+~', '');

  // trim
  $text = \HH\Lib\Str\trim($text);

  // lowercase
  $text = \HH\Lib\Str\lowercase($text);

  return $text;
}