from nc_dnsapi import Client
import os, urllib3

customer = os.environ["NC_CUSTOMER"]
api_password = os.environ["NC_API_PASSWORD"]
api_key = os.environ["NC_API_KEY"]
domain = os.environ["NC_DOMAIN"]

ip = str(urllib3.request("GET", "https://api.ipify.org").data)

with Client(customer, api_key, api_password) as api:
    to_be_updated = []
    records = api.dns_records(domain)

    for record in records:
        if record.type in ["A", "AAAA"] and record.destination != ip:
            record.destination = ip
            to_be_updated.append(record)


    api.update_dns_records(domain, to_be_updated)

    zone = api.dns_zone(domain)
    zone.ttl = 300
    api.update_dns_zone(domain, zone)
