from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rooms import views

# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'windows', views.WindowViewSet, basename="windows")
router.register(r'window_fittings', views.WindowFittingsViewSet,
                basename="window_fittings")
router.register(r'rooms_native', views.RoomViewSet, basename="rooms_native")
router.register(r'rooms_v2', views.RoomsRelatedV2ViewSet, basename="rooms_v2")
router.register(r'rooms_mat_view',
                views.RoomsRelatedObjectsViewSet, basename="rooms_mat_view")
router.register(r'souvenirs', views.SouvenirViewSet, basename="souvenirs")
router.register(r'tables', views.TableViewSet, basename="tables")
router.register(r'doors', views.DoorViewSet, basename="doors")
router.register(r'chairs', views.ChairViewSet, basename="chairs")
router.register(r'beds', views.BedViewSet, basename="beds")
router.register(r'decorations', views.DecorationViewSet,
                basename="decorations")

# The API URLs are now determined automatically by the router.
urlpatterns = [
    path('', include(router.urls)),
]
