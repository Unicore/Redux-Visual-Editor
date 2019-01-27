struct ActionsLinks {
    let links: [ActionsList.Action: [StatesList.State]]
    
    static let initial = ActionsLinks(links: [:])
}

func reduce(_ old: ActionsLinks, with action: Action) -> ActionsLinks {
    return old
}
