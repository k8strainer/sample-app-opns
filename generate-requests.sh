APP_ROUTE=$(o get route sample-app-route --no-headers | awk '{print $2}')
while true; do curl -s http://$APP_ROUTE/ -n sample-app >/dev/null 2>&1 ; sleep 0.5; done
#while true; do curl -s http://$APP_ROUTE/ ; sleep 0.5; done


