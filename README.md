# zhSieve
A ruby based zhihu content crawler

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/gwzz/zhSieve/blob/master/LICENSE)
[![Gem Version](https://badge.fury.io/rb/zhSieve.svg)](https://badge.fury.io/rb/zhSieve)
###
Status: under working :construction:

### Pre-Request
Create cookies.txt file and put it into root folder. (Mozilla cookies.txt-style)

### Usage
Crawler specific answer, and output it as markdown format.
```shell
$ zhSieve answer -q 'Your Question Id' -a 'Your Answer Id'
```
Crawler specific Zhuanlan article, and output it as markdown format.
```shell
$ zhSieve answer -z 'Your Question Id'
```
### TO-DO List

- [ ] Question :rotating_light:
- [ ] Ansewer :construction:
  - Use question_id and answer_id to crawler page information, and output a markdown file with ["question title and link", "author's avatar, name, biography", "answer content"].
  - Testing:warning:!
- [ ] People :construction:
- [ ] ZhuanLan, cantains two components
  -	1. Crawler single article :construction:
  - 2. Crawler someone's zhuanlan category :rotating_light:


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gwzz/zhSieve. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

