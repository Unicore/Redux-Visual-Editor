struct StatesLinks {
    let links: [StatesList.State: [PropsList.Props]]
    
    static let initial = StatesLinks(links: [:])
}

func reduce(_ old: StatesLinks, with action: Action) -> StatesLinks {
    return old
}


