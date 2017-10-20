import urllib.request
import gzip
import json
from collections import OrderedDict
import time

url = 'http://data.taipei/youbike'

while True:
    urllib.request.urlretrieve(url, 'YouBikeTP.gz')

    f = gzip.open('YouBikeTP.gz', 'r')
    jdata = f.read().decode("utf8")
    f.close()

    data = json.loads(jdata, object_pairs_hook=OrderedDict)

    with open('YouBikeTP.json', 'w') as outfile:
        json.dump(data, outfile, ensure_ascii=False)

    print ('更新時間：' + time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))

    time.sleep(60)
