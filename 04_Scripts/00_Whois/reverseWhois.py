import urllib
import sys


# commandline argument registrant
try:
    apiCallRegistrant = sys.argv[1]
except:
    apiCallRegistrant = "hostmaster%40united-domains.de"


apiCallBase="http://viewdns.info/reversewhois/?q="
apiCall=apiCallBase+apiCallRegistrant



def do_ApiCall (apiCall):
        try:
                urlHandle= urllib.urlopen(apiCall)
                httpData = urlHandle.read()
                try:
                        print httpData
                        urlHandle.close()
                        return httpData
                except:
                        print "httpDataHandle error in APICall"
                        traceback.print_exc()
        except:
                print "urlHandle open error in APICall"
                traceback.print_exc()
