import scrapy


class playerInfoSpider(scrapy.Spider):
    name = "players"
    start_urls = [
        'http://www.fifaindex.com/players/?league=13',
    ]

    def parse(self, response):
            yield {
                'text': response.css("div.container div.row div.col-md-8 div#no-more-tables table.table-striped tbody tr:nth-child(5) .r2:nth-child(1)::text , tr:nth-child(5) .r2:nth-child(2)::text, tr:nth-child(5) td:nth-child(4) a::text, tr:nth-child(5) td:nth-child(5) span::text, tr:nth-child(5) td:nth-child(6)::text, tr:nth-child(5) td:nth-child(7) a:nth-child(1) img:nth-child(1)").extract(),
            }
