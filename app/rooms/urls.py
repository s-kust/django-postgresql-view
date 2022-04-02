from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rooms import views

# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'windows', views.WindowViewSet, basename="windows")
router.register(r'rooms', views.RoomViewSet, basename="rooms")
router.register(r'rooms2', views.RoomsRelatedObjectsViewSet, basename="rooms2")
router.register(r'souvenirs', views.SouvenirViewSet, basename="souvenirs")
router.register(r'tables', views.TableViewSet, basename="tables")

# The API URLs are now determined automatically by the router.
urlpatterns = [
    path('', include(router.urls)),
]
