import scrapy
from datetime import date


class AbonnesSpider(scrapy.Spider):
    name = "abonnes"

    def start_requests(self):
        yield scrapy.Request(url="https://www.nextinpact.com", callback=self.parse)

    def parse(self, response):
        now = date.today()
        today=now.strftime("%Y-%m-%d")

        today

        yield {
            'date': today,
            'abonnes': response.css(".nbAbonne::text").get()

        }
