actor CarPark {
    private var cars: [String] = []
    private var maxCars = 5

    func addCar(_ car: String) -> String {
        self.cars.append(car)
        return car
    }

    nonisolated func readCars() -> Int {
        return self.maxCars
    }
}
